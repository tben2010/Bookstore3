page 50101 "Book Card"
{
    PageType = Card;
    SourceTable = Book;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; "No")
                {
                    ApplicationArea = ALL;
                }
                field(Title; Title)
                {
                    ApplicationArea = ALL;
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field(Autor; Autor)
                {
                    ApplicationArea = ALL;
                }
                field(Hardcover; Hardcover)
                {
                    ApplicationArea = ALL;
                }

                field("Page Count"; "Page Count")
                {
                    ApplicationArea = ALL;
                }

            }
        }
    }
}