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
     MyNotifications: Record "My Notifications";
   begin
     if Customer.Get(Rec."Sell-to Customer No.") then 
        if Customer."Credit Amount" > 0 then
          //Ob in meinerBenachrichtung aktiviert ist
          IF NOT MyNotifications.IsEnabledForRecord(GetMyNotificationID, Database::Customer) THEN 
          EXIT;

          TheNotification.Id := GetMyNotificationID;
          TheNotification.Scope := NotificationScope::LocalScope;
          TheNotification.Message := 'Kunden Krediltimit Check';
          TheNotification.SetData('Kunde', Customer."No.");
          TheNotification.SetData('Lagerort', Customer."Location Code");
          TheNotification.AddAction('Open Customer Card', Codeunit::NotificationCustomerCard, 'ShowCustomerCard');
          TheNotification.Send;
   end;

   local procedure GetMyNotificationID(): Guid
   begin
     EXIT('4d3b9fe3-f64a-4a4c-b684-47b356e35d16');
   end;
   
   [EventSubscriber(ObjectType::Page, Page:: "My Notifications", 'OnInitializingNotificationWithDefaultState', '', false, false)]
   local procedure "MyNotifications.OnInitializingNotificationWithDefaultState"()
   var
     MyNotifications: Record "My Notifications";
     NotificationName: label 'Mein Kunden Check', maxlength = 128, locked = true;
     DescriptionText: label 'Kunde wird geprüft', locked = true;
   begin
     MyNotifications.InsertDefaultWithTableNum(GetMyNotificationID(),
                         NotificationName,
                         DescriptionText,
                         Database::Customer);
   end;
   
   //Do the following to check whether the notification needs to be sent:
   //declare a local variable: "MyNotifications" 
   //IF NOT MyNotifications.IsEnabledForRecord(GetMyNotificationID,"TableName") THEN EXIT;
}