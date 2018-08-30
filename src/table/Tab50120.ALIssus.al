table 50120 "ALIssus"
{

    fields
    {
     
        field(1;"url";Text[250])
        {
            Caption='url';
        }
        field(2;"repository_url";Text[250])
        {
            Caption='repository_url';
        }
        field(3;"labels_url";Text[250])
        {
            Caption='labels_url';
        }
        field(4;"comments_url";Text[250])
        {
            Caption='comments_url';
        }
        field(5;"events_url";Text[250])
        {
            Caption='events_url';
        }
        field(6;"html_url";Text[250])
        {
            Caption='html_url';
        }
        field(7;"id";Integer)
        {
            Caption='id';
        }
        field(8;"node_id";Text[250])
        {
            Caption='node_id';
        }
        field(9;"number";Integer)
        {
            Caption='number';
        }
        field(10;"title";Text[250])
        {
            Caption='title';
        }
        field(11;"state";Text[250])
        {
            Caption='state';
        }
        field(12;"locked";Boolean)
        {
            Caption='locked';
        }
        field(13;"comments";Integer)
        {
            Caption='comments';
        }
        field(14;"created_at";Text[250])
        {
            Caption='created_at';
        }
        field(15;"updated_at";Text[250])
        {
            Caption='updated_at';
        }
        field(16;"author_association";Text[250])
        {
            Caption='author_association';
        }
        field(17;"body";Text[250])
        {
            Caption='body';
        }
    
    }

    keys
    {
        key(PK;id)
        {
            Clustered = true;
        }

    }

    procedure RefreshALIssus();
    var
        RefreshALIssus : Codeunit RefreshALIssus;
    begin
        RefreshALIssus.Refresh();
    end;

}
