codeunit 50103 "NotificationCustomerCard"
{
   procedure ShowCustomerCard(TheNotification: Notification);
   begin
       if TheNotification.HasData('Kunde') then
         Message('Kunde ist %1', TheNotification.GetData('Kunde'));
       Page.Run(Page::"Customer Card");
   end;


   [EventSubscriber(ObjectType::Page, 42, 'OnOpenPageEvent', '', false, false)]
   local procedure CheckKreditlimit(var Rec: Record 36)
   var 
     Customer : Record 18;
     TheNotification: Notification;

   begin
     if Customer.Get(Rec."Sell-to Customer No.") then 
        if Customer."Credit Amount" > 0 then
          TheNotification.Id := '4d3b9fe3-f64a-4a4c-b684-47b356e35d16';
          TheNotification.Scope := NotificationScope::LocalScope;
          TheNotification.Message := 'Kunden Krediltimit Check';
          TheNotification.SetData('Kunde', '4711');
          TheNotification.SetData('Lagerort', Customer."Location Code");
          TheNotification.AddAction('Open Customer Card', Codeunit::NotificationCustomerCard, 'ShowCustomerCard');
          TheNotification.Send;
   end;
}