codeunit 50100 "Show Today"
{

    //Globale Variable, können am Anfang oder am Ende stehen
    var
        myString: Text;
        CurrDate: Date;

    trigger OnRun()
    //Lokale Variable für den OnRun Trigger
    var
        myMessage: Text;

    begin
        myMessage := 'Heute ist der';
        CurrDate := Today();
        MyCurrentDateMessage(CurrDate);
        ShowDateAndText(CurrDate, myMessage);
    end;

    local procedure MyCurrentDateMessage(ReqDate: Date)
    begin
        Message('FKt. Today is %1', ReqDate);
    end;

    local procedure ShowDateAndText(ReqDate: Date; MyText: Text)
    begin
        Message('%1,%2', myText, ReqDate);

    end;

}