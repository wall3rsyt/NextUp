-- =============================================
--  ALLE TALEN - automatisch geladen via Config.Locale
--  Instellen in config.lua: Config.Locale = 'nl'
--  Beschikbaar: nl en de fr es pt pl tr sv da it ru cs ro hu ar zh ja ko
-- =============================================

local Locales = {}

-- ar
Locales['ar'] = {
    progressTitel    = 'غسيل الأموال',
    interactLabel    = 'غسيل الأموال',
    startGestart     = 'توجه إلى الموقع على GPS.',
    teWeinigItem     = 'الأموال القذرة غير كافية! (الحد الأدنى: $%d)',
    alActief         = 'لديك بالفعل جلسة غسيل نشطة!',
    cooldown         = 'يجب الانتظار: %d دقيقة %d ثانية.',
    progressLabel    = 'طرق الباب...',
    geannuleerd      = 'تم إلغاء الغسيل.',
    klopSucces       = 'تم الغسيل: $%d → $%d نظيف. $%d أموال قذرة متبقية.',
    sessieklaar      = 'تم الغسيل كله! لا توجد أموال قذرة.',
    volgende         = 'الموقع التالي خلال %d ثانية...',
    sessieFout       = 'لم يتم العثور على جلسة نشطة.',
    locatieFout      = 'أنت لست في الموقع الصحيح.',
    tokenFout        = 'انتهت صلاحية الجلسة. حاول مجدداً.',
    serverFout       = 'خطأ في الخادم. حاول مجدداً.',
    foutVerwijder    = 'خطأ في إزالة العنصر.',
    ongeldigBedrag   = 'مبلغ غير صالح.',
    deepwebMelding   = 'تنبيه! تلقيت رسالة من الشبكة المظلمة...',
    deepwebVolgende  = 'الموقع التالي من الشبكة المظلمة خلال %d ثانية...',
}

-- cs
Locales['cs'] = {
    progressTitel    = 'Praní peněz',
    interactLabel    = 'Prát peníze',
    startGestart     = 'Jeď na místo na GPS.',
    teWeinigItem     = 'Nedostatek špinavých peněz! (Min: $%d)',
    alActief         = 'Už máš aktivní sezení praní!',
    cooldown         = 'Musíš počkat: %dm %ds.',
    progressLabel    = 'Klepání na dveře...',
    geannuleerd      = 'Praní zrušeno.',
    klopSucces       = 'Vyprání: $%d → $%d čistých. Zbývá $%d špinavých peněz.',
    sessieklaar      = 'Vše vypráno! Žádné špinavé peníze.',
    volgende         = 'Další místo za %ds...',
    sessieFout       = 'Nenalezeno aktivní sezení.',
    locatieFout      = 'Nejsi na správném místě.',
    tokenFout        = 'Sezení vypršelo. Zkus znovu.',
    serverFout       = 'Chyba serveru. Zkus znovu.',
    foutVerwijder    = 'Chyba při odstraňování předmětu.',
    ongeldigBedrag   = 'Neplatná částka.',
    deepwebMelding   = 'Varování! Obdržel jsi zprávu z dark webu...',
    deepwebVolgende  = 'Příští deepweb lokace za %ds...',
}

-- da
Locales['da'] = {
    progressTitel    = 'Hvidvaskning',
    interactLabel    = 'Hvidvask penge',
    startGestart     = 'Gå til stedet på din GPS.',
    teWeinigItem     = 'Ikke nok snavsede penge! (Min: $%d)',
    alActief         = 'Du har allerede en aktiv hvidvaskningssession!',
    cooldown         = 'Du skal vente: %dm %ds.',
    progressLabel    = 'Banker på døren...',
    geannuleerd      = 'Hvidvaskning annulleret.',
    klopSucces       = 'Hvidvasket: $%d → $%d rent. $%d snavsede penge tilbage.',
    sessieklaar      = 'Alt hvidvasket! Ingen snavsede penge tilbage.',
    volgende         = 'Næste sted om %ds...',
    sessieFout       = 'Ingen aktiv session fundet.',
    locatieFout      = 'Du er ikke på det rigtige sted.',
    tokenFout        = 'Session udløbet. Prøv igen.',
    serverFout       = 'Serverfejl. Prøv igen.',
    foutVerwijder    = 'Fejl ved fjernelse af genstand.',
    ongeldigBedrag   = 'Ugyldigt beløb.',
    deepwebMelding   = 'Advarsel! Du har modtaget en besked fra dark web...',
    deepwebVolgende  = 'Næste deepweb-sted om %ds...',
}

-- de
Locales['de'] = {
    progressTitel    = 'Geldwäsche',
    interactLabel    = 'Geld waschen',
    startGestart     = 'Fahre zum markierten Ort auf deinem GPS.',
    teWeinigItem     = 'Nicht genug Schwarzgeld zum Starten! (Min: $%d)',
    alActief         = 'Du hast bereits eine aktive Wäschesitzung!',
    cooldown         = 'Du musst noch warten: %dm %ds.',
    progressLabel    = 'An der Tür klopfen...',
    geannuleerd      = 'Geldwäsche abgebrochen.',
    klopSucces       = 'Gewaschen: $%d → $%d sauber. Noch $%d Schwarzgeld übrig.',
    sessieklaar      = 'Alles gewaschen! Kein Schwarzgeld mehr vorhanden.',
    volgende         = 'Nächster Standort in %ds...',
    sessieFout       = 'Keine aktive Sitzung gefunden.',
    locatieFout      = 'Du bist nicht am richtigen Ort.',
    tokenFout        = 'Sitzung abgelaufen. Erneut versuchen.',
    serverFout       = 'Serverfehler. Erneut versuchen.',
    foutVerwijder    = 'Fehler beim Entfernen des Gegenstands.',
    ongeldigBedrag   = 'Ungültiger Betrag.',
    deepwebMelding   = 'Warnung! Du hast eine Nachricht aus dem Darknet erhalten...',
    deepwebVolgende  = 'Nächster Deepweb-Standort in %ds...',
}

-- en
Locales['en'] = {
    progressTitel    = 'Laundering',
    interactLabel    = 'Launder Money',
    startGestart     = 'Head to the location on your GPS.',
    teWeinigItem     = 'Not enough dirty money to start! (Min: $%d)',
    alActief         = 'You already have an active launder session!',
    cooldown         = 'You must wait: %dm %ds.',
    progressLabel    = 'Knocking on the door...',
    geannuleerd      = 'Laundering cancelled.',
    klopSucces       = 'Laundered: $%d → $%d clean. $%d dirty money remaining.',
    sessieklaar      = 'All laundered! You have no more dirty money.',
    volgende         = 'Next location in %ds...',
    sessieFout       = 'No active session found.',
    locatieFout      = 'You are not at the correct location.',
    tokenFout        = 'Session expired. Try again.',
    serverFout       = 'Server error. Try again.',
    foutVerwijder    = 'Error removing item.',
    ongeldigBedrag   = 'Invalid amount.',
    deepwebMelding   = 'Warning! You received a message from the dark web...',
    deepwebVolgende  = 'Next deepweb location in %ds...',
}

-- es
Locales['es'] = {
    progressTitel    = 'Lavado',
    interactLabel    = 'Lavar dinero',
    startGestart     = 'Dirígete a la ubicación en tu GPS.',
    teWeinigItem     = '¡No tienes suficiente dinero sucio para empezar! (Mín: $%d)',
    alActief         = '¡Ya tienes una sesión de lavado activa!',
    cooldown         = 'Debes esperar: %dm %ds.',
    progressLabel    = 'Llamando a la puerta...',
    geannuleerd      = 'Lavado cancelado.',
    klopSucces       = 'Lavado: $%d → $%d limpio. $%d de dinero sucio restante.',
    sessieklaar      = '¡Todo lavado! Ya no tienes dinero sucio.',
    volgende         = 'Próxima ubicación en %ds...',
    sessieFout       = 'No se encontró sesión activa.',
    locatieFout      = 'No estás en la ubicación correcta.',
    tokenFout        = 'Sesión expirada. Inténtalo de nuevo.',
    serverFout       = 'Error del servidor. Inténtalo de nuevo.',
    foutVerwijder    = 'Error al eliminar el objeto.',
    ongeldigBedrag   = 'Cantidad inválida.',
    deepwebMelding   = '¡Advertencia! Has recibido un mensaje de la dark web...',
    deepwebVolgende  = 'Próxima ubicación deepweb en %ds...',
}

-- fr
Locales['fr'] = {
    progressTitel    = 'Blanchiment',
    interactLabel    = 'Blanchir l\'argent',
    startGestart     = 'Rendez-vous à l\'emplacement sur votre GPS.',
    teWeinigItem     = 'Pas assez d\'argent sale pour commencer ! (Min: $%d)',
    alActief         = 'Vous avez déjà une session de blanchiment active !',
    cooldown         = 'Vous devez attendre : %dm %ds.',
    progressLabel    = 'Frapper à la porte...',
    geannuleerd      = 'Blanchiment annulé.',
    klopSucces       = 'Blanchi : $%d → $%d propre. $%d d\'argent sale restant.',
    sessieklaar      = 'Tout blanchi ! Plus d\'argent sale.',
    volgende         = 'Prochain emplacement dans %ds...',
    sessieFout       = 'Aucune session active trouvée.',
    locatieFout      = 'Vous n\'êtes pas au bon endroit.',
    tokenFout        = 'Session expirée. Réessayez.',
    serverFout       = 'Erreur serveur. Réessayez.',
    foutVerwijder    = 'Erreur lors de la suppression de l\'objet.',
    ongeldigBedrag   = 'Montant invalide.',
    deepwebMelding   = 'Attention ! Vous avez reçu un message du dark web...',
    deepwebVolgende  = 'Prochain emplacement deepweb dans %ds...',
}

-- hu
Locales['hu'] = {
    progressTitel    = 'Pénzmosás',
    interactLabel    = 'Pénz mosása',
    startGestart     = 'Menj a GPS-en jelzett helyre.',
    teWeinigItem     = 'Nincs elég piszkos pénz! (Min: $%d)',
    alActief         = 'Már van egy aktív mosási munkameneted!',
    cooldown         = 'Várnod kell: %dp %ds.',
    progressLabel    = 'Kopogás az ajtón...',
    geannuleerd      = 'Pénzmosás megszakítva.',
    klopSucces       = 'Mosva: $%d → $%d tiszta. $%d piszkos pénz maradt.',
    sessieklaar      = 'Minden mosva! Nincs több piszkos pénz.',
    volgende         = 'Következő helyszín %ds múlva...',
    sessieFout       = 'Nem található aktív munkamenet.',
    locatieFout      = 'Nem a megfelelő helyen vagy.',
    tokenFout        = 'Munkamenet lejárt. Próbáld újra.',
    serverFout       = 'Szerverhiba. Próbáld újra.',
    foutVerwijder    = 'Hiba a tárgy eltávolításakor.',
    ongeldigBedrag   = 'Érvénytelen összeg.',
    deepwebMelding   = 'Figyelmeztetés! Üzenetet kaptál a dark webről...',
    deepwebVolgende  = 'Következő deepweb helyszín %ds múlva...',
}

-- it
Locales['it'] = {
    progressTitel    = 'Riciclaggio',
    interactLabel    = 'Ricicla denaro',
    startGestart     = 'Recati alla posizione sul GPS.',
    teWeinigItem     = 'Denaro sporco insufficiente! (Min: $%d)',
    alActief         = 'Hai già una sessione di riciclaggio attiva!',
    cooldown         = 'Devi aspettare: %dm %ds.',
    progressLabel    = 'Bussando alla porta...',
    geannuleerd      = 'Riciclaggio annullato.',
    klopSucces       = 'Riciclato: $%d → $%d pulito. $%d denaro sporco rimanente.',
    sessieklaar      = 'Tutto riciclato! Nessun denaro sporco rimasto.',
    volgende         = 'Prossima posizione tra %ds...',
    sessieFout       = 'Nessuna sessione attiva trovata.',
    locatieFout      = 'Non sei nella posizione corretta.',
    tokenFout        = 'Sessione scaduta. Riprova.',
    serverFout       = 'Errore server. Riprova.',
    foutVerwijder    = 'Errore nella rimozione dell\'oggetto.',
    ongeldigBedrag   = 'Importo non valido.',
    deepwebMelding   = 'Attenzione! Hai ricevuto un messaggio dal dark web...',
    deepwebVolgende  = 'Prossima posizione deepweb tra %ds...',
}

-- ja
Locales['ja'] = {
    progressTitel    = 'マネーロンダリング',
    interactLabel    = 'マネーロンダリング',
    startGestart     = 'GPSの場所に向かってください。',
    teWeinigItem     = '汚いお金が足りません！(最低: $%d)',
    alActief         = 'すでにアクティブなセッションがあります！',
    cooldown         = '待つ必要があります: %d分%d秒。',
    progressLabel    = 'ドアをノックしています...',
    geannuleerd      = 'ロンダリングがキャンセルされました。',
    klopSucces       = 'ロンダリング済: $%d → $%dクリーン。$%dの汚いお金が残っています。',
    sessieklaar      = 'すべてロンダリングしました！汚いお金はもうありません。',
    volgende         = '%d秒後に次の場所...',
    sessieFout       = 'アクティブなセッションが見つかりません。',
    locatieFout      = '正しい場所にいません。',
    tokenFout        = 'セッションが期限切れです。再試行してください。',
    serverFout       = 'サーバーエラー。再試行してください。',
    foutVerwijder    = 'アイテムの削除中にエラーが発生しました。',
    ongeldigBedrag   = '無効な金額です。',
    deepwebMelding   = '警告！ダークウェブからメッセージを受け取りました...',
    deepwebVolgende  = '次のディープウェブの場所まで%d秒...',
}

-- ko
Locales['ko'] = {
    progressTitel    = '돈세탁',
    interactLabel    = '돈세탁',
    startGestart     = 'GPS의 위치로 이동하세요.',
    teWeinigItem     = '검은 돈이 부족합니다! (최소: $%d)',
    alActief         = '이미 활성 세션이 있습니다!',
    cooldown         = '기다려야 합니다: %d분 %d초.',
    progressLabel    = '문을 두드리는 중...',
    geannuleerd      = '세탁이 취소되었습니다.',
    klopSucces       = '세탁됨: $%d → $%d 깨끗함. 검은 돈 $%d 남음.',
    sessieklaar      = '모두 세탁됨! 검은 돈이 더 이상 없습니다.',
    volgende         = '%d초 후 다음 위치...',
    sessieFout       = '활성 세션을 찾을 수 없습니다.',
    locatieFout      = '올바른 위치에 있지 않습니다.',
    tokenFout        = '세션이 만료되었습니다. 다시 시도하세요.',
    serverFout       = '서버 오류. 다시 시도하세요.',
    foutVerwijder    = '아이템 제거 중 오류.',
    ongeldigBedrag   = '잘못된 금액.',
    deepwebMelding   = '경고! 다크웹에서 메시지를 받았습니다...',
    deepwebVolgende  = '다음 딥웹 위치까지 %d초...',
}

-- nl
Locales['nl'] = {
    progressTitel    = 'Witwas',
    interactLabel    = 'Witwassen',
    startGestart     = 'Ga naar de locatie op je GPS.',
    teWeinigItem     = 'Je hebt niet genoeg zwart geld om te starten! (Min: $%d)',
    alActief         = 'Je bent al bezig met een wassessie!',
    cooldown         = 'Je moet nog wachten: %dm %ds.',
    progressLabel    = 'Kloppen op de deur...',
    geannuleerd      = 'Wassen geannuleerd.',
    klopSucces       = 'Gewassen: $%d → $%d schoon. Nog $%d zwart geld over.',
    sessieklaar      = 'Alles gewassen! Je had geen zwart geld meer.',
    volgende         = 'Volgende locatie over %ds...',
    sessieFout       = 'Geen actieve sessie gevonden.',
    locatieFout      = 'Je staat niet bij de juiste locatie.',
    tokenFout        = 'Sessie verlopen. Probeer opnieuw.',
    serverFout       = 'Serverfout. Probeer opnieuw.',
    foutVerwijder    = 'Fout bij verwijderen item.',
    ongeldigBedrag   = 'Ongeldig bedrag.',
    deepwebMelding   = 'Waarschuwing! Je hebt een bericht ontvangen via het dark web...',
    deepwebVolgende  = 'Volgende deepweb locatie over %ds...',
}

-- pl
Locales['pl'] = {
    progressTitel    = 'Pranie pieniędzy',
    interactLabel    = 'Praj pieniądze',
    startGestart     = 'Jedź do lokalizacji na GPS.',
    teWeinigItem     = 'Za mało brudnych pieniędzy! (Min: $%d)',
    alActief         = 'Masz już aktywną sesję prania!',
    cooldown         = 'Musisz poczekać: %dm %ds.',
    progressLabel    = 'Pukanie do drzwi...',
    geannuleerd      = 'Pranie anulowane.',
    klopSucces       = 'Uprane: $%d → $%d czyste. Pozostało $%d brudnych pieniędzy.',
    sessieklaar      = 'Wszystko uprane! Brak brudnych pieniędzy.',
    volgende         = 'Następna lokalizacja za %ds...',
    sessieFout       = 'Nie znaleziono aktywnej sesji.',
    locatieFout      = 'Nie jesteś we właściwej lokalizacji.',
    tokenFout        = 'Sesja wygasła. Spróbuj ponownie.',
    serverFout       = 'Błąd serwera. Spróbuj ponownie.',
    foutVerwijder    = 'Błąd podczas usuwania przedmiotu.',
    ongeldigBedrag   = 'Nieprawidłowa kwota.',
    deepwebMelding   = 'Uwaga! Otrzymałeś wiadomość z dark webu...',
    deepwebVolgende  = 'Następna lokalizacja deepweb za %ds...',
}

-- pt
Locales['pt'] = {
    progressTitel    = 'Lavagem',
    interactLabel    = 'Lavar dinheiro',
    startGestart     = 'Vá para o local no seu GPS.',
    teWeinigItem     = 'Dinheiro sujo insuficiente para começar! (Mín: $%d)',
    alActief         = 'Você já tem uma sessão de lavagem ativa!',
    cooldown         = 'Você precisa esperar: %dm %ds.',
    progressLabel    = 'Batendo na porta...',
    geannuleerd      = 'Lavagem cancelada.',
    klopSucces       = 'Lavado: $%d → $%d limpo. $%d de dinheiro sujo restante.',
    sessieklaar      = 'Tudo lavado! Sem mais dinheiro sujo.',
    volgende         = 'Próximo local em %ds...',
    sessieFout       = 'Nenhuma sessão ativa encontrada.',
    locatieFout      = 'Você não está no local correto.',
    tokenFout        = 'Sessão expirada. Tente novamente.',
    serverFout       = 'Erro no servidor. Tente novamente.',
    foutVerwijder    = 'Erro ao remover item.',
    ongeldigBedrag   = 'Valor inválido.',
    deepwebMelding   = 'Atenção! Você recebeu uma mensagem da dark web...',
    deepwebVolgende  = 'Próxima localização deepweb em %ds...',
}

-- ro
Locales['ro'] = {
    progressTitel    = 'Spălare bani',
    interactLabel    = 'Spală bani',
    startGestart     = 'Mergi la locația de pe GPS.',
    teWeinigItem     = 'Bani murdari insuficienți! (Min: $%d)',
    alActief         = 'Ai deja o sesiune activă de spălare!',
    cooldown         = 'Trebuie să aștepți: %dm %ds.',
    progressLabel    = 'Bătând la ușă...',
    geannuleerd      = 'Spălarea anulată.',
    klopSucces       = 'Spălat: $%d → $%d curat. $%d bani murdari rămași.',
    sessieklaar      = 'Totul spălat! Nu mai sunt bani murdari.',
    volgende         = 'Următoarea locație în %ds...',
    sessieFout       = 'Nu s-a găsit nicio sesiune activă.',
    locatieFout      = 'Nu ești la locația corectă.',
    tokenFout        = 'Sesiunea a expirat. Încearcă din nou.',
    serverFout       = 'Eroare server. Încearcă din nou.',
    foutVerwijder    = 'Eroare la eliminarea obiectului.',
    ongeldigBedrag   = 'Sumă invalidă.',
    deepwebMelding   = 'Atenție! Ai primit un mesaj de pe dark web...',
    deepwebVolgende  = 'Următoarea locație deepweb în %ds...',
}

-- ru
Locales['ru'] = {
    progressTitel    = 'Отмывание',
    interactLabel    = 'Отмыть деньги',
    startGestart     = 'Направляйся к месту на GPS.',
    teWeinigItem     = 'Недостаточно грязных денег! (Мин: $%d)',
    alActief         = 'У тебя уже есть активная сессия отмывания!',
    cooldown         = 'Нужно подождать: %dм %dс.',
    progressLabel    = 'Стучу в дверь...',
    geannuleerd      = 'Отмывание отменено.',
    klopSucces       = 'Отмыто: $%d → $%d чистых. Осталось $%d грязных денег.',
    sessieklaar      = 'Всё отмыто! Грязных денег больше нет.',
    volgende         = 'Следующее место через %dс...',
    sessieFout       = 'Активная сессия не найдена.',
    locatieFout      = 'Ты не на правильном месте.',
    tokenFout        = 'Сессия истекла. Попробуй снова.',
    serverFout       = 'Ошибка сервера. Попробуй снова.',
    foutVerwijder    = 'Ошибка при удалении предмета.',
    ongeldigBedrag   = 'Неверная сумма.',
    deepwebMelding   = 'Внимание! Ты получил сообщение из даркнета...',
    deepwebVolgende  = 'Следующее место deepweb через %dс...',
}

-- sv
Locales['sv'] = {
    progressTitel    = 'Penningtvätt',
    interactLabel    = 'Tvätta pengar',
    startGestart     = 'Bege dig till platsen på din GPS.',
    teWeinigItem     = 'Inte tillräckligt med smutsiga pengar! (Min: $%d)',
    alActief         = 'Du har redan en aktiv tvättsession!',
    cooldown         = 'Du måste vänta: %dm %ds.',
    progressLabel    = 'Knackar på dörren...',
    geannuleerd      = 'Tvätten avbruten.',
    klopSucces       = 'Tvättat: $%d → $%d rent. $%d smutsiga pengar kvar.',
    sessieklaar      = 'Allt tvättat! Inga smutsiga pengar kvar.',
    volgende         = 'Nästa plats om %ds...',
    sessieFout       = 'Ingen aktiv session hittades.',
    locatieFout      = 'Du är inte på rätt plats.',
    tokenFout        = 'Session utgången. Försök igen.',
    serverFout       = 'Serverfel. Försök igen.',
    foutVerwijder    = 'Fel vid borttagning av föremål.',
    ongeldigBedrag   = 'Ogiltigt belopp.',
    deepwebMelding   = 'Varning! Du har fått ett meddelande från dark web...',
    deepwebVolgende  = 'Nästa deepweb-plats om %ds...',
}

-- tr
Locales['tr'] = {
    progressTitel    = 'Kara Para Aklaması',
    interactLabel    = 'Para akla',
    startGestart     = 'GPS\'teki konuma git.',
    teWeinigItem     = 'Başlamak için yeterli kara para yok! (Min: $%d)',
    alActief         = 'Zaten aktif bir aklama oturumun var!',
    cooldown         = 'Beklemelisin: %dd %ds.',
    progressLabel    = 'Kapıya vuruyorum...',
    geannuleerd      = 'Aklama iptal edildi.',
    klopSucces       = 'Aklandı: $%d → $%d temiz. $%d kara para kaldı.',
    sessieklaar      = 'Hepsi aklandı! Artık kara para yok.',
    volgende         = 'Sonraki konum %ds içinde...',
    sessieFout       = 'Aktif oturum bulunamadı.',
    locatieFout      = 'Doğru konumda değilsin.',
    tokenFout        = 'Oturum süresi doldu. Tekrar dene.',
    serverFout       = 'Sunucu hatası. Tekrar dene.',
    foutVerwijder    = 'Öğe kaldırılırken hata.',
    ongeldigBedrag   = 'Geçersiz miktar.',
    deepwebMelding   = 'Uyarı! Dark webden bir mesaj aldınız...',
    deepwebVolgende  = 'Sonraki deepweb konumu %ds içinde...',
}

-- zh
Locales['zh'] = {
    progressTitel    = '洗钱',
    interactLabel    = '洗钱',
    startGestart     = '前往GPS上的位置。',
    teWeinigItem     = '黑钱不足以开始！(最低: $%d)',
    alActief         = '你已有一个活跃的洗钱会话！',
    cooldown         = '需要等待: %d分%d秒。',
    progressLabel    = '敲门中...',
    geannuleerd      = '洗钱已取消。',
    klopSucces       = '已洗: $%d → $%d 干净。剩余 $%d 黑钱。',
    sessieklaar      = '全部洗完！没有更多黑钱了。',
    volgende         = '%d秒后下一个地点...',
    sessieFout       = '未找到活跃会话。',
    locatieFout      = '你不在正确的位置。',
    tokenFout        = '会话已过期。请重试。',
    serverFout       = '服务器错误。请重试。',
    foutVerwijder    = '删除物品时出错。',
    ongeldigBedrag   = '金额无效。',
    deepwebMelding   = '警告！你收到了来自暗网的消息...',
    deepwebVolgende  = '下一个深网地点在%d秒后...',
}

-- Laad de juiste taal op basis van Config.Locale
Lang = Locales[Config.Locale] or Locales['en']

if not Locales[Config.Locale] then
    print('^1[WITWAS] ^7Taal "' .. tostring(Config.Locale) .. '" niet gevonden! Fallback naar Engels.')
end