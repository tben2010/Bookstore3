page 50120 "ALIssusList"
{
    PageType = List;
    SourceTable = ALIssus;
    Caption ='List of ALIssus';
    Editable = false;
    SourceTableView=order(descending);
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                
                field("url";"url") {
                    ApplicationArea = All;
                }
                field("repository_url";"repository_url") {
                    ApplicationArea = All;
                }
                field("labels_url";"labels_url") {
                    ApplicationArea = All;
                }
                field("comments_url";"comments_url") {
                    ApplicationArea = All;
                }
                field("events_url";"events_url") {
                    ApplicationArea = All;
                }
                field("html_url";"html_url") {
                    ApplicationArea = All;
                }
                field("id";"id") {
                    ApplicationArea = All;
                }
                field("node_id";"node_id") {
                    ApplicationArea = All;
                }
                field("number";"number") {
                    ApplicationArea = All;
                }
                field("title";"title") {
                    ApplicationArea = All;
                }
                field("state";"state") {
                    ApplicationArea = All;
                }
                field("locked";"locked") {
                    ApplicationArea = All;
                }
                field("comments";"comments") {
                    ApplicationArea = All;
                }
                field("created_at";"created_at") {
                    ApplicationArea = All;
                }
                field("updated_at";"updated_at") {
                    ApplicationArea = All;
                }
                field("author_association";"author_association") {
                    ApplicationArea = All;
                }
                field("body";"body") {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action(RefreshALIssus)
            {
                Caption ='Refresh ALIssus';
                Promoted=true;
                PromotedCategory=Process;
                Image=RefreshLines;
                ApplicationArea = All;
                trigger OnAction();
                begin
                    RefreshALIssus();
                    CurrPage.Update;
                    if FindFirst then;
                end;
            }
        }
    }
}
