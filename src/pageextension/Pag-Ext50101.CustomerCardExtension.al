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

        addbefore(Control149)
        {
            part(BookDetailsFactBox; "Book Detail Fact Box")
            {
                Caption = 'Book Details';
                ApplicationArea = All;
                SubPageLink =  No = field("Bookno.");
            }
        }


    }
}