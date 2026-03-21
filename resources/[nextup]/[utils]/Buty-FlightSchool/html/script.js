let SelectedLicense = null;
let SelectedExam = null;
let TheoreticalExamData = [ ];
let CurrentQuestionIndex = 0;
let ActiveQuestion = null;
let MistakeCounter = 0;
let RemainingTime = null;
let Timer = null;
let Licenses = [ ];
let Prices = [ ];

function ShowQuestion() {
    let QuestionData = TheoreticalExamData.Questions[SelectedLicense][CurrentQuestionIndex];
    window.$('#questionindex').html(CurrentQuestionIndex + 1);
    window.$('#examtime').html(MsToTable());
    window.$('#questiontitle').html(QuestionData.Question);
    window.$('#firstanswer').html(QuestionData.Answers[0].Text);
    window.$('#secondanswer').html(QuestionData.Answers[1].Text);
    window.$('#thirdanswer').html(QuestionData.Answers[2].Text);
    ActiveQuestion = QuestionData;
}

function MsToTable() {
    let seconds = parseInt((RemainingTime / 1000) % 60);
    let minutes = parseInt((RemainingTime / (1000 * 60)) % 60);
    minutes = (minutes < 10) ? '0' + minutes : minutes;
    seconds = (seconds < 10) ? '0' + seconds : seconds;
    return minutes + ':' + seconds;
}

function StartTimer() {
    Timer = setInterval(function() {
        RemainingTime = RemainingTime - 1000;
        window.$('#examtime').html(MsToTable());
        if (RemainingTime == 0) {
            window.$('.slider-inner').addClass('left');
            clearInterval(Timer);
        }
    }, 1000);
}

function StartPracticalTimer() {
    Timer = setInterval(function() {
        RemainingTime = RemainingTime - 1000;
        window.$('#missiontimer').html(MsToTable());
        if (RemainingTime == 0) {
            window.$.post(`https://${GetParentResourceName()}/missionFailed`, JSON.stringify({}));
            clearInterval(Timer);
        }
    }, 1000);
}

function SelecteAnswer(number) {
    switch (number) {
        case 1:
            if (ActiveQuestion.Answers[0].Right) {
                window.$('#question-'+(CurrentQuestionIndex + 1)+'').addClass('correct');
            } else {
                window.$('#question-'+(CurrentQuestionIndex + 1)+'').addClass('false');
                MistakeCounter++;
            }
            break;
        case 2:
            if (ActiveQuestion.Answers[1].Right) {
                window.$('#question-'+(CurrentQuestionIndex + 1)+'').addClass('correct');
            } else {
                window.$('#question-'+(CurrentQuestionIndex + 1)+'').addClass('false');
                MistakeCounter++;
            }
            break;
        case 3:
            if (ActiveQuestion.Answers[2].Right) {
                window.$('#question-'+(CurrentQuestionIndex + 1)+'').addClass('correct');
            } else {
                window.$('#question-'+(CurrentQuestionIndex + 1)+'').addClass('false');
                MistakeCounter++;
            }
            break;
    }
    if (CurrentQuestionIndex == TheoreticalExamData.Questions[SelectedLicense].length - 1) {
        if (MistakeCounter > TheoreticalExamData.MistakeMax) {
            window.$('.slider-inner').addClass('left');
        } else {
            window.$('.slider-inner').addClass('right');
            window.$.post(`https://${GetParentResourceName()}/addLicense`, JSON.stringify({
                license: SelectedLicense,
                exam: SelectedExam
            }));
        }
        clearInterval(Timer);
    } else {
        CurrentQuestionIndex++;
        ShowQuestion();
    }
}

window.$(document).ready(function() {

    window.$('#theoreticaltest').on('click', function() {
        if (SelectedLicense == 'airplane' && Licenses.airplane.theoretical) return;
        if (SelectedLicense == 'helicopter' && Licenses.helicopter.theoretical) return;
        window.$('.exam-popup').addClass('active');
        SelectedExam = 'theoretical';
        if (SelectedLicense == 'airplane') {
            window.$('#totalexam').html('$'+Prices.Airplane.Theoretical);
        } else {
            window.$('#totalexam').html('$'+Prices.Helicopter.Theoretical);
        }
    });

    window.$('#practicaltest').on('click', function() {
        if (SelectedLicense == 'airplane' && !Licenses.airplane.theoretical) return;
        if (SelectedLicense == 'helicopter' && !Licenses.helicopter.theoretical) return;
        if (SelectedLicense == 'airplane' && Licenses.airplane.practical) return;
        if (SelectedLicense == 'helicopter' && Licenses.helicopter.practical) return;
        window.$('.exam-popup').addClass('active');
        SelectedExam = 'practical';
        if (SelectedLicense == 'airplane') {
            window.$('#totalexam').html('$'+Prices.Airplane.Practical);
        } else {
            window.$('#totalexam').html('$'+Prices.Helicopter.Practical);
        }
    });

    window.$('#airplanelicense').on('click', function() {
        SelectedLicense = 'airplane';
        window.$('.license-title').html('AIRPLANE');
        window.$('.license-popup').addClass('active');
        if (Licenses.airplane.theoretical) {
            window.$('.theoretical-icon').addClass('active');
        } else {
            window.$('.theoretical-icon').removeClass('active');
        }
        if (Licenses.airplane.practical) {
            window.$('.practical-icon').addClass('active');
        } else {
            window.$('.practical-icon').removeClass('active');
        }
        window.$('#theoreticalprice').html('$'+Prices.Airplane.Theoretical);
        window.$('#practicalprice').html('$'+Prices.Airplane.Practical);
    });

    window.$('#helilicense').on('click', function() {
        SelectedLicense = 'helicopter';
        window.$('.license-title').html('HELICOPTER');
        window.$('.license-popup').addClass('active');
        if (Licenses.helicopter.theoretical) {
            window.$('.theoretical-icon').addClass('active');
        } else {
            window.$('.theoretical-icon').removeClass('active');
        }
        if (Licenses.helicopter.practical) {
            window.$('.practical-icon').addClass('active');
        } else {
            window.$('.practical-icon').removeClass('active');
        }
        window.$('#theoreticalprice').html('$'+Prices.Helicopter.Theoretical);
        window.$('#practicalprice').html('$'+Prices.Helicopter.Practical);
    });

    window.$('#examclose').on('click', function() {
        window.$('.exam-popup').removeClass('active');
    });

    window.$('#examstart').on('click', function() {
        let examPrice = null;
        if (SelectedLicense == 'airplane' && SelectedExam == 'theoretical') {
            examPrice = Prices.Airplane.Theoretical;
        } else if (SelectedLicense == 'airplane' && SelectedExam == 'practical') {
            examPrice = Prices.Airplane.Practical;
        } else if (SelectedLicense == 'helicopter' && SelectedExam == 'theoretical') {
            examPrice = Prices.Helicopter.Theoretical;
        } else if (SelectedLicense == 'helicopter' && SelectedExam == 'practical') {
            examPrice = Prices.Helicopter.Practical;
        }
        window.$.post(`https://${GetParentResourceName()}/checkBalance`, JSON.stringify({
            price: examPrice
        }), function(result) {
            if (result) {
                if (SelectedExam == 'theoretical') {
                    CurrentQuestionIndex = 0;
                    ActiveQuestion = null;
                    MistakeCounter = 0;
                    RemainingTime = TheoreticalExamData.ExamTime * 60000;
                    window.$('.slider-inner').addClass('top');
                    window.$('.questions').html('');
                    for (let idx = 0; idx < TheoreticalExamData.Questions[SelectedLicense].length; idx++) {
                        window.$('.questions').append(`<div class='question' id='question-`+(idx + 1)+`'>`+(idx + 1)+`</div>`);
                    }
                    ShowQuestion();
                    StartTimer();
                } else {
                    window.$.post(`https://${GetParentResourceName()}/startPractical`, JSON.stringify({
                        type: SelectedLicense
                    }), function(canStart) {
                        if (canStart) {
                            window.$('.slider-inner').addClass('bottom');
                        }
                    });
                }
                window.$('.exam-popup').removeClass('active');
            }
        });
    });

    window.$('#firstanswer').on('click', function() {
        SelecteAnswer(1);
    });

    window.$('#secondanswer').on('click', function() {
        SelecteAnswer(2);
    });

    window.$('#thirdanswer').on('click', function() {
        SelecteAnswer(3);
    });

    window.$('#failaccept').on('click', function() {
        window.$('.slider-inner').removeClass('left');
        window.$('.slider-inner').removeClass('right');
        window.$('.slider-inner').removeClass('top');
        window.$('.slider-inner').removeClass('bottom');
    });

    window.$('#passaccept').on('click', function() {
        window.$('.slider-inner').removeClass('left');
        window.$('.slider-inner').removeClass('right');
        window.$('.slider-inner').removeClass('top');
        window.$('.slider-inner').removeClass('bottom');
    });

    window.addEventListener('message', event => {
        switch (event.data.type) {
            case 'ShowUI':
                window.$('.slider').css('display', 'initial');
                TheoreticalExamData = event.data.theoreticalExam;
                Licenses = event.data.licenses;
                Prices = event.data.prices;
                window.$('#airplaneprice').html('$'+(Prices.Airplane.Theoretical + Prices.Airplane.Practical));
                window.$('#helicopterprice').html('$'+(Prices.Helicopter.Theoretical + Prices.Helicopter.Practical));
                break;
            case 'UpdateLicenses':
                Licenses = event.data.licenses;
                if (SelectedLicense == 'airplane') {
                    if (Licenses.airplane.theoretical) {
                        window.$('.theoretical-icon').addClass('active');
                    } else {
                        window.$('.theoretical-icon').removeClass('active');
                    }
                    if (Licenses.airplane.practical) {
                        window.$('.practical-icon').addClass('active');
                    } else {
                        window.$('.practical-icon').removeClass('active');
                    }
                } else {
                    if (Licenses.helicopter.theoretical) {
                        window.$('.theoretical-icon').addClass('active');
                    } else {
                        window.$('.theoretical-icon').removeClass('active');
                    }
                    if (Licenses.helicopter.practical) {
                        window.$('.practical-icon').addClass('active');
                    } else {
                        window.$('.practical-icon').removeClass('active');
                    }
                }
                break;
            case 'UpdateMission':
                window.$('#missiontitle').html(event.data.currentMission + ' MISSION');
                window.$('#missiontext').html(event.data.missionText);
                if (event.data.examTime) {
                    RemainingTime = event.data.examTime * 60000;
                    StartPracticalTimer();
                }
                break;
            case 'HideMission':
                window.$('.slider-inner').removeClass('bottom');
                if (event.data.result) {
                    window.$('.slider-inner').addClass('right');
                } else {
                    window.$('.slider-inner').addClass('left');
                }
                clearInterval(Timer);
                break;
        }
    });

    window.$(document).keyup(function(e) {
        if (e.keyCode == 27) {
            window.$('.slider').css('display', 'none');
            window.$('.license-popup').removeClass('active');
            window.$('.exam-popup').removeClass('active');
            window.$.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        }
    });

});