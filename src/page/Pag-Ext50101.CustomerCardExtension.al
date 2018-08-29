pageextension 50101 "CustomerCardExtension" extends "Customer Card" //MyTargetPageId
{
    layout
    {
        addlast(General)
        {
            field("Bookno.";"Bookno.") {
                ApplicationArea = ALL;
                Editable = true;
                Visible = true;
            }
        }
    }
}