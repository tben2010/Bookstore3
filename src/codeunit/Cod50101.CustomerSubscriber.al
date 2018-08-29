codeunit 50101 "CustomerSubscriber"
{
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterInsertEvent', '', true, true)]

    local procedure CustomerOnAfterInsert(var Rec: Record Customer; RunTrigger: Boolean)
    begin
        Message(myTextMessageAlsLabel);
    end;

    var
        //Label dient zur Übersetzung im Translation File, Comment und MaxLength und Locked sind Optional
        myTextMessageAlsLabel: Label 'Kunde eingefügt', Comment='Info für Übersetzer', MaxLength=20, Locked=true ;
}