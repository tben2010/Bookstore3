codeunit 50101 "CustomerSubscriber"
{
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterInsertEvent', '', true, true)]

    local procedure CustomerOnAfterInsert(var Rec: Record Customer; RunTrigger: Boolean)
    begin
        Message('Kunde eingefügt');
    end;
}