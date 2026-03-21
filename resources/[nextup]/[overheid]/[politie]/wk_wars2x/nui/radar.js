/*-----------------------------------------------------------------------------------------

	Wraith ARS 2X
	Created by WolfKnight
	Adapted for custom NL HTML by Claude

	MIT License
	Copyright (c) 2020-2021 WolfKnight

-----------------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------------
	Variables
------------------------------------------------------------------------------------*/
var uiEdited = false;

const audioNames = {
	beep: "beep.ogg",
	xmit_on: "xmit_on.ogg",
	xmit_off: "xmit_off.ogg",
	done: "done.ogg",
	front: "front.ogg",
	rear: "rear.ogg",
	closing: "closing.ogg",
	away: "away.ogg",
	plate_hit: "plate_hit.ogg",
	speed_alert: "speed_alert.ogg"
};

const lockAudio = {
	front: { 1: "away", 2: "closing" },
	rear:  { 1: "closing", 2: "away" }
};

// Element map — matched exactly to the new HTML IDs
const elements = {
	radar:         $( "#radarFrame" ),
	remote:        $( "#rc" ),
	plateReader:   $( "#plateReaderFrame" ),

	pwrBtn:        $( "#pwrBtn" ),

	uiSettingsBtn: $( "#uiSettings" ),
	uiSettingsBox: $( "#uiSettingsBox" ),
	closeUiBtn:    $( "#closeUiSettings" ),

	plateReaderBtn: $( "#plateReaderBtn" ),
	plateReaderBox: $( "#plateReaderBox" ),
	boloText:       $( "#boloText" ),
	setBoloBtn:     $( "#setBoloPlate" ),
	clearBoloBtn:   $( "#clearBoloPlate" ),
	closePrBtn:     $( "#closePlateReaderSettings" ),

	openHelp:    $( "#helpBtn" ),
	helpWindow:  $( "#helpWindow" ),
	helpWeb:     $( "#helpWeb" ),
	closeHelp:   $( "#closeHelp" ),

	closeNewUser: $( "#closeNewUserMsg" ),
	newUser:      $( "#newUser" ),
	openQsv:      $( "#showQuickStartVideo" ),
	qsvWindow:    $( "#quickStart" ),
	qsvWeb:       $( "#quickStartVideo" ),
	closeQsv:     $( "#closeQuickStart" ),

	radarScaling: {
		increase: $( "#radarIncreaseScale" ),
		decrease: $( "#radarDecreaseScale" ),
		display:  $( "#radarScaleDisplay" )
	},

	remoteScaling: {
		increase: $( "#remoteIncreaseScale" ),
		decrease: $( "#remoteDecreaseScale" ),
		display:  $( "#remoteScaleDisplay" )
	},

	plateReaderScaling: {
		increase: $( "#readerIncreaseScale" ),
		decrease: $( "#readerDecreaseScale" ),
		display:  $( "#readerScaleDisplay" )
	},

	// Plate reader — only the IDs that exist in the new HTML
	plates: {
		front: {
			fill: $( "#frontPlateTextFill" ),
			img:  $( "#frontPlateImg" ),
			lock: $( "#frontPlateLock" )
		},
		rear: {
			fill: $( "#rearPlateTextFill" ),
			img:  $( "#rearPlateImg" ),
			lock: $( "#rearPlateLock" )
		}
	},

	safezoneSlider:  $( "#safezone" ),
	safezoneDisplay: $( "#safezoneDisplay" ),

	keyLock: {
		label:      $( "#keyLockLabel" ),
		stateLabel: $( "#keyLockStateLabel" )
	},

	patrolSpeed: $( "#patrolSpeed" ),

	antennas: {
		front: {
			targetSpeed: $( "#frontSpeed" ),
			fastSpeed:   $( "#frontFastSpeed" ),

			// Direction arrows — only fwd/bwd exist in new HTML (no fast arrows)
			dirs: {
				fwd: $( "#frontDirAway" ),
				bwd: $( "#frontDirTowards" )
			},

			modes: {
				same: $( "#frontSame" ),
				opp:  $( "#frontOpp" ),
				xmit: $( "#frontXmit" )
			}
		},

		rear: {
			targetSpeed: $( "#rearSpeed" ),
			fastSpeed:   $( "#rearFastSpeed" ),

			dirs: {
				fwd: $( "#rearDirTowards" ),
				bwd: $( "#rearDirAway" )
			},

			modes: {
				same: $( "#rearSame" ),
				opp:  $( "#rearOpp" ),
				xmit: $( "#rearXmit" )
			}
		}
	}
};

const modes = { off: 0, same: 1, opp: 2, both: 3 };
const dirs  = { none: 0, closing: 1, away: 2 };


/*------------------------------------------------------------------------------------
	Initial hide
------------------------------------------------------------------------------------*/
elements.radar.hide();
elements.remote.hide();
elements.plateReader.hide();
elements.plateReaderBox.hide();
elements.uiSettingsBox.hide();
elements.keyLock.label.hide();
elements.helpWindow.hide();
elements.qsvWindow.hide();
elements.newUser.hide();


/*------------------------------------------------------------------------------------
	Button wiring
------------------------------------------------------------------------------------*/
elements.uiSettingsBtn.click( () => setEleVisible( elements.uiSettingsBox, true ) );
elements.plateReaderBtn.click( () => setEleVisible( elements.plateReaderBox, true ) );

elements.openHelp.click( () => { setEleVisible( elements.helpWindow, true ); loadHelp( true ); } );
elements.closeHelp.click( () => { setEleVisible( elements.helpWindow, false ); loadHelp( false ); } );

elements.closeNewUser.click( () => { setEleVisible( elements.newUser, false ); sendData( "qsvWatched", {} ); } );

elements.openQsv.click( () => {
	setEleVisible( elements.newUser, false );
	setEleVisible( elements.qsvWindow, true );
	loadQuickStartVideo( true );
} );

elements.closeQsv.click( () => {
	setEleVisible( elements.qsvWindow, false );
	loadQuickStartVideo( false );
	sendData( "qsvWatched", {} );
} );

elements.closeUiBtn.click( () => setEleVisible( elements.uiSettingsBox, false ) );
elements.closePrBtn.click( () => setEleVisible( elements.plateReaderBox, false ) );


/*------------------------------------------------------------------------------------
	Setters
------------------------------------------------------------------------------------*/
function setEleVisible( ele, state ) {
	state ? ele.fadeIn() : ele.fadeOut();
}

// Light a mode/dir badge on or off
function setLight( ant, cat, item, state ) {
	let obj = elements.antennas[ant][cat][item];
	if ( !obj || !obj.length ) return; // guard: skip if element doesn't exist in HTML

	if ( state ) {
		obj.addClass( cat === "dirs" ? "active_arrow" : "active" );
	} else {
		obj.removeClass( cat === "dirs" ? "active_arrow" : "active" );
	}
}

function setAntennaXmit( ant, state ) {
	setLight( ant, "modes", "xmit", state );

	if ( !state ) {
		clearDirs( ant );
		elements.antennas[ant].targetSpeed.html( "¦¦¦" );
		elements.antennas[ant].fastSpeed.html( "HLd" );
	} else {
		elements.antennas[ant].fastSpeed.html( "¦¦¦" );
	}

	// Toggle pulse animation on the XMIT badge
	let xmitBadge = elements.antennas[ant].modes.xmit;
	state ? xmitBadge.addClass( "xmit-active" ) : xmitBadge.removeClass( "xmit-active" );
}

function setAntennaMode( ant, mode ) {
	setLight( ant, "modes", "same", mode === modes.same );
	setLight( ant, "modes", "opp",  mode === modes.opp );
}

// Fast mode and lock — new HTML has no separate LED elements for these,
// so we reflect the state in the fast speed display text colour instead
function setAntennaFastMode( ant, state ) {
	let el = elements.antennas[ant].fastSpeed;
	state ? el.css( "color", "var(--amber)" ) : el.css( "color", "" );
}

function setAntennaLock( ant, state ) {
	let el = elements.antennas[ant].fastSpeed;
	state ? el.css( "color", "var(--accent)" ) : el.css( "color", "" );
}

function setAntennaDirs( ant, dir ) {
	// fwd = closing (towards), bwd = away
	setLight( ant, "dirs", "fwd", dir === dirs.closing );
	setLight( ant, "dirs", "bwd", dir === dirs.away );
}

// Plate lock — uses classes from the new HTML (.locked)
function setPlateLock( cam, state, isBolo ) {
	let obj = elements.plates[cam];

	if ( state ) {
		obj.lock.addClass( "locked" );

		if ( isBolo ) {
			// Flash the plate fill text for 3 s as visual alert
			obj.fill.addClass( "plate_hit" );
			setTimeout( () => obj.fill.removeClass( "plate_hit" ), 3000 );
		}
	} else {
		obj.lock.removeClass( "locked" );
	}
}

// Sets the plate image and fills the overlay text
function setPlate( cam, plate, index ) {
	let pl = elements.plates[cam];

	// Update plate background image
	pl.img.attr( "src", "images/plates/" + index + ".png" );

	// Update the overlay text
	pl.fill.html( plate );

	// Adjust text colour for yellow plates (index 1 or 2)
	if ( index === 1 || index === 2 ) {
		pl.fill.css( "color", "#f5c800" );
	} else {
		pl.fill.css( "color", "var(--accent)" );
	}
}


/*------------------------------------------------------------------------------------
	Clearing
------------------------------------------------------------------------------------*/
function clearDirs( ant ) {
	for ( let i in elements.antennas[ant].dirs ) {
		elements.antennas[ant].dirs[i].removeClass( "active_arrow" );
	}
}

function clearModes( ant ) {
	for ( let i in elements.antennas[ant].modes ) {
		elements.antennas[ant].modes[i].removeClass( "active" ).removeClass( "xmit-active" );
	}
}

function clearAntenna( ant ) {
	clearModes( ant );
	clearDirs( ant );
	elements.antennas[ant].targetSpeed.html( "---" );
	elements.antennas[ant].fastSpeed.html( "--" );
}

function clearEverything() {
	elements.patrolSpeed.html( "-- km/u" );
	for ( let i in elements.antennas ) { clearAntenna( i ); }
}


/*------------------------------------------------------------------------------------
	Power up / down
------------------------------------------------------------------------------------*/
function poweringUp() {
	elements.patrolSpeed.html( "888" );

	for ( let i of [ "front", "rear" ] ) {
		let e = elements.antennas[i];
		e.targetSpeed.html( "888" );
		e.fastSpeed.html( "888" );

		for ( let a of [ "dirs", "modes" ] ) {
			for ( let obj in e[a] ) {
				a === "dirs"
					? e[a][obj].addClass( "active_arrow" )
					: e[a][obj].addClass( "active" );
			}
		}
	}
}

function poweredUp( fastDisplay ) {
	clearEverything();

	for ( let ant of [ "front", "rear" ] ) {
		setAntennaXmit( ant, false );
		setAntennaFastMode( ant, fastDisplay );
	}
}

function radarPower( state, override, fastDisplay ) {
	state ? ( override ? poweredUp( fastDisplay ) : poweringUp() ) : clearEverything();
}


/*------------------------------------------------------------------------------------
	Display updates
------------------------------------------------------------------------------------*/
function updateDisplays( ps, ants ) {
	elements.patrolSpeed.html( ps + " km/u" );

	for ( let ant in ants ) {
		if ( ants[ant] != null ) {
			let e = elements.antennas[ant];

			e.targetSpeed.html( ants[ant][0].speed );
			e.fastSpeed.html( ants[ant][1].speed );

			// Only pass target direction (no fast direction arrows in new HTML)
			setAntennaDirs( ant, ants[ant][0].dir );

			// Remove 'empty' class when we have real data
			e.targetSpeed.removeClass( "empty" );
		}
	}
}

function settingUpdate( ants ) {
	for ( let ant in ants ) {
		setAntennaXmit( ant, ants[ant].xmit );
		setAntennaMode( ant, ants[ant].mode );
		setAntennaFastMode( ant, ants[ant].fast );
		setAntennaLock( ant, ants[ant].speedLocked );
	}
}


/*------------------------------------------------------------------------------------
	Menu display
------------------------------------------------------------------------------------*/
function menu( optionText, option ) {
	clearEverything();
	elements.antennas.front.targetSpeed.html( optionText[0] );
	elements.antennas.front.fastSpeed.html( optionText[1] );
	elements.patrolSpeed.html( option );
}


/*------------------------------------------------------------------------------------
	Key lock label
------------------------------------------------------------------------------------*/
var keyLockTimeout;

function displayKeyLock( state ) {
	let sl = elements.keyLock.stateLabel;
	sl.html( state ? "geblokkeerd" : "ingeschakeld" );
	state ? sl.addClass( "red" ).removeClass( "green" ) : sl.addClass( "green" ).removeClass( "red" );
	elements.keyLock.label.fadeIn();
	clearTimeout( keyLockTimeout );
	keyLockTimeout = setTimeout( () => elements.keyLock.label.fadeOut(), 2000 );
}


/*------------------------------------------------------------------------------------
	Audio
------------------------------------------------------------------------------------*/
function playAudio( name, vol ) {
	let audio = new Audio( "sounds/" + audioNames[name] );
	audio.volume = vol;
	audio.play();
}

function playLockAudio( ant, dir, vol ) {
	playAudio( ant, vol );
	if ( dir > 0 ) {
		setTimeout( () => playAudio( lockAudio[ant][dir], vol ), 500 );
	}
}


/*------------------------------------------------------------------------------------
	BOLO plate
------------------------------------------------------------------------------------*/
elements.setBoloBtn.click( function() {
	let plate = elements.boloText.val().toUpperCase();
	let spaceAmount = 8 - plate.length;

	if ( spaceAmount > 0 ) {
		let split = spaceAmount / 2;
		let text = plate.padStart( plate.length + Math.floor( split ) );
		text = text.padEnd( text.length + Math.ceil( split ) );
		sendData( "setBoloPlate", text );
	} else {
		sendData( "setBoloPlate", plate );
	}
} );

elements.clearBoloBtn.click( () => sendData( "clearBoloPlate", null ) );

function checkPlateInput( event ) {
	if ( !/[a-zA-Z0-9 ]/g.test( event.key ) ) event.preventDefault();
}


/*------------------------------------------------------------------------------------
	Help / Quick Start
------------------------------------------------------------------------------------*/
function loadHelp( state ) {
	elements.helpWeb.attr( "src", state
		? "https://wolfknight98.github.io/wk_wars2x_web/manual.pdf"
		: "about:blank"
	);
}

function loadQuickStartVideo( state ) {
	elements.qsvWeb.attr( "src", state
		? "https://www.youtube-nocookie.com/embed/B-6VD8pXNYE"
		: "about:blank"
	);
}


/*------------------------------------------------------------------------------------
	NUI data sender
------------------------------------------------------------------------------------*/
$.ajaxSetup({ headers: { "Content-Type": "application/json; charset=UTF-8" } });

function sendData( name, data ) {
	$.post( "https://wk_wars2x/" + name, JSON.stringify( data ), function( datab ) {
		if ( datab !== "ok" ) console.log( datab );
	} );
}


/*------------------------------------------------------------------------------------
	UI save/load
------------------------------------------------------------------------------------*/
function setUiHasBeenEdited( state ) { uiEdited = state; }
function hasUiBeenEdited() { return uiEdited; }

function sendSaveData() {
	if ( !hasUiBeenEdited() ) return;

	sendData( "saveUiData", {
		remote:      { left: elements.remote.css("left"),      top: elements.remote.css("top"),      scale: remoteScale },
		radar:       { left: elements.radar.css("left"),       top: elements.radar.css("top"),        scale: radarScale },
		plateReader: { left: elements.plateReader.css("left"), top: elements.plateReader.css("top"),  scale: readerScale },
		safezone
	} );
}

function loadUiSettings( data, isSave ) {
	for ( let setting of [ "remote", "radar", "plateReader" ] ) {
		let ele = elements[setting];

		if ( isSave ) {
			ele.css( "left", data[setting].left );
			ele.css( "top",  data[setting].top );
			setScaleAndDisplay( ele, data[setting].scale, elements[setting + "Scaling"].display );
		} else {
			setScaleAndDisplay( ele, data.scale[setting], elements[setting + "Scaling"].display );

			let w = ele.outerWidth()  * data.scale[setting];
			let h = ele.outerHeight() * data.scale[setting];

			switch ( setting ) {
				case "remote":
					ele.css( "left", "calc( 50% - " + w / 2 + "px )" );
					ele.css( "top",  "calc( 50% - " + h / 2 + "px )" );
					break;
				case "radar":
					ele.css( "left", "calc( ( 100% - " + data.safezone + "px ) - " + w + "px )" );
					ele.css( "top",  "calc( ( 100% - " + data.safezone + "px ) - " + h + "px )" );
					break;
				case "plateReader":
					ele.css( "left", "calc( ( 100% - " + data.safezone + "px ) - " + w + "px )" );
					ele.css( "top",  "calc( 50% - " + h / 2 + "px )" );
					break;
			}
		}
	}

	remoteScale = isSave ? data.remote.scale      : data.scale.remote;
	radarScale  = isSave ? data.radar.scale        : data.scale.radar;
	readerScale = isSave ? data.plateReader.scale  : data.scale.plateReader;

	elements.safezoneSlider.val( data.safezone );
	elements.safezoneSlider.trigger( "input" );
}


/*------------------------------------------------------------------------------------
	UI scaling & dragging
------------------------------------------------------------------------------------*/
var remoteScale = 1.0, remoteMoving = false, remoteOffset = [0,0];
var radarScale  = 1.0, radarMoving  = false, radarOffset  = [0,0];
var readerScale = 1.0, readerMoving = false, readerOffset = [0,0];
var windowWidth = 0, windowHeight = 0, safezone = 0;

elements.remoteScaling.increase.click( () => { remoteScale = changeEleScale( elements.remote, remoteScale, 0.05, elements.remoteScaling.display ); } );
elements.remoteScaling.decrease.click( () => { remoteScale = changeEleScale( elements.remote, remoteScale, -0.05, elements.remoteScaling.display ); } );

elements.radarScaling.increase.click( () => { radarScale = changeEleScale( elements.radar, radarScale, 0.05, elements.radarScaling.display ); } );
elements.radarScaling.decrease.click( () => { radarScale = changeEleScale( elements.radar, radarScale, -0.05, elements.radarScaling.display ); } );

elements.plateReaderScaling.increase.click( () => { readerScale = changeEleScale( elements.plateReader, readerScale, 0.05, elements.plateReaderScaling.display ); } );
elements.plateReaderScaling.decrease.click( () => { readerScale = changeEleScale( elements.plateReader, readerScale, -0.05, elements.plateReaderScaling.display ); } );

elements.remote.mousedown( function( e ) { remoteMoving = true; remoteOffset = getOffset( $(this).offset(), e.clientX, e.clientY ); } );
elements.radar.mousedown(  function( e ) { radarMoving  = true; radarOffset  = getOffset( $(this).offset(), e.clientX, e.clientY ); } );
elements.plateReader.mousedown( function( e ) { readerMoving = true; readerOffset = getOffset( $(this).offset(), e.clientX, e.clientY ); } );

$( document ).mouseup( () => { remoteMoving = radarMoving = readerMoving = false; } );

$( document ).mousemove( function( e ) {
	let x = e.clientX, y = e.clientY;
	if ( remoteMoving ) { e.preventDefault(); calculatePos( elements.remote,      x, y, windowWidth, windowHeight, remoteOffset, remoteScale, safezone ); }
	if ( radarMoving )  { e.preventDefault(); calculatePos( elements.radar,       x, y, windowWidth, windowHeight, radarOffset,  radarScale,  safezone ); }
	if ( readerMoving ) { e.preventDefault(); calculatePos( elements.plateReader, x, y, windowWidth, windowHeight, readerOffset, readerScale, safezone ); }
} );

$( window ).resize( function() { windowWidth = $(this).width(); windowHeight = $(this).height(); } );
$( document ).ready( function() { windowWidth = $(window).width(); windowHeight = $(window).height(); } );

elements.safezoneSlider.on( "input", function() {
	safezone = parseInt( $(this).val(), 10 );
	elements.safezoneDisplay.html( safezone + "px" );
} );

function calculatePos( ele, x, y, w, h, offset, scale, safezone ) {
	let ew = ele.outerWidth()  * scale;
	let eh = ele.outerHeight() * scale;
	let left = clamp( x + offset[0], safezone, w - ew - safezone );
	let top  = clamp( y + offset[1], safezone, h - eh - safezone );
	let lp   = ( left / w ) * 100;
	let tp   = ( top  / h ) * 100;
	let ewp  = ( ew / w ) * 50;
	let ehp  = ( eh / h ) * 50;

	if ( lp + ewp >= 49 && lp + ewp <= 51 ) lp = 50 - ewp;
	if ( tp + ehp >= 49 && tp + ehp <= 51 ) tp = 50 - ehp;

	updatePosition( ele, lp, tp );
	setUiHasBeenEdited( true );
}

function updatePosition( ele, left, top ) {
	ele.css( "left", left + "%" );
	ele.css( "top",  top  + "%" );
}

function getOffset( offset, x, y ) { return [ offset.left - x, offset.top - y ]; }

function changeEleScale( ele, scaleVar, amount, display ) {
	let scale = changeScale( ele, scaleVar, amount );
	display.html( scale.toFixed(2) + "x" );
	setUiHasBeenEdited( true );
	return scale;
}

function changeScale( ele, current, amount ) {
	let scale = clamp( current + amount, 0.25, 2.5 );
	ele.css( "transform", "scale(" + scale + ")" );
	return scale;
}

function setScaleAndDisplay( ele, scale, display ) {
	ele.css( "transform", "scale(" + scale + ")" );
	display.html( scale.toFixed(2) + "x" );
}

function clamp( num, min, max ) { return num < min ? min : num > max ? max : num; }


/*------------------------------------------------------------------------------------
	NUI button auto-wiring (data-nuitype attributes)
------------------------------------------------------------------------------------*/
$( "body" ).find( "button, div" ).each( function() {
	if ( $( this ).attr( "data-nuitype" ) ) {
		$( this ).click( function() {
			let type  = $( this ).data( "nuitype" );
			let value = $( this ).attr( "data-value" ) ? $( this ).data( "value" ) : null;
			let mode  = $( this ).attr( "data-mode" )  ? $( this ).data( "mode" )  : null;
			sendData( type, { value, mode } );
		} );
	}
} );


/*------------------------------------------------------------------------------------
	Close remote (Escape / right-click)
------------------------------------------------------------------------------------*/
function closeRemote() {
	sendData( "closeRemote", {} );
	setEleVisible( elements.plateReaderBox, false );
	setEleVisible( elements.uiSettingsBox,  false );
	setEleVisible( elements.helpWindow,     false );
	setEleVisible( elements.newUser,        false );
	setEleVisible( elements.qsvWindow,      false );
	loadHelp( false );
	loadQuickStartVideo( false );
	setEleVisible( elements.remote, false );
	sendSaveData();
}

$( document ).keyup( function( e ) { if ( e.keyCode === 27 ) closeRemote(); } );
$( document ).contextmenu( closeRemote );


/*------------------------------------------------------------------------------------
	NUI message handler
------------------------------------------------------------------------------------*/
window.addEventListener( "message", function( event ) {
	let item = event.data;
	let type = event.data._type;

	switch ( type ) {
		case "loadUiSettings":     loadUiSettings( item.data, true );         break;
		case "setUiDefaults":      loadUiSettings( item.data, false );        break;
		case "displayKeyLock":     displayKeyLock( item.state );              break;
		case "showNewUser":        setEleVisible( elements.newUser, true );   break;
		case "openRemote":         setEleVisible( elements.remote, true ); setUiHasBeenEdited( false ); break;
		case "setRadarDisplayState": setEleVisible( elements.radar, item.state ); break;
		case "radarPower":         radarPower( item.state, item.override, item.fast ); break;
		case "poweredUp":          poweredUp( item.fast );                    break;
		case "update":             updateDisplays( item.speed, item.antennas ); break;
		case "antennaXmit":        setAntennaXmit( item.ant, item.on );       break;
		case "antennaMode":        setAntennaMode( item.ant, item.mode );      break;
		case "antennaLock":        setAntennaLock( item.ant, item.state );     break;
		case "antennaFast":        setAntennaFastMode( item.ant, item.state ); break;
		case "menu":               menu( item.text, item.option );             break;
		case "settingUpdate":      settingUpdate( item.antennaData );          break;
		case "setReaderDisplayState": setEleVisible( elements.plateReader, item.state ); break;
		case "changePlate":        setPlate( item.cam, item.plate, item.index ); break;
		case "lockPlate":          setPlateLock( item.cam, item.state, item.isBolo ); break;
		case "audio":              playAudio( item.name, item.vol );           break;
		case "lockAudio":          playLockAudio( item.ant, item.dir, item.vol ); break;
		default: break;
	}
} );