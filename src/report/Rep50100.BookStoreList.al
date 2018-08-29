report 50100 "BookStoreList"
{
    Caption = 'Book List';
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report50100.BookList.rdlc';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;


    dataset
    {
        dataitem(SingleRowData; Integer)
        {
            DataItemTableView = sorting () where (Number = const (1));
            column(COMPANYNAME; CompanyProperty.DisplayName()) { }
            column(ShowPageCount; ShowPageCount) { }
        }
        dataitem(Book; Book)
        {
            RequestFilterFields = "No", Autor;

            column(No_Book; "No") { IncludeCaption = true; }
            column(Title_Book; Title) { IncludeCaption = true; }
            column(Author_Book; Autor) { IncludeCaption = true; }
            column(PageCount_Book; "Page count") { IncludeCaption = true; }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowPageCount; ShowPageCount)
                    {
                        ApplicationArea = all;
                        Caption = 'Show Page Count';
                    }
                }
            }
        }
    }

    labels
    {
        TitleCaption = 'Book - List', Comment = 'Title shown in the upper left corner in header', Locked = false;
        PageCaption = 'Page {0} of {1}';
    }

    var
        ShowPageCount: Boolean;

}