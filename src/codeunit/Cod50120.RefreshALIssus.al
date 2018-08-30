codeunit 50120 "RefreshALIssus"
{
    procedure Refresh();
    var
        ALIssus : Record ALIssus;
        HttpClient : HttpClient;
        ResponseMessage : HttpResponseMessage;
        JsonToken : JsonToken;
        JsonValue : JsonValue;
        JsonObject : JsonObject;
        JsonArray : JsonArray;
        JsonText : text;
        i : Integer;
    begin
        ALIssus.DeleteAll;

        // Simple web service call
        HttpClient.DefaultRequestHeaders.Add('User-Agent','Dynamics 365');
        if not HttpClient.Get('https://api.github.com/repos/Microsoft/AL/issues',
                              ResponseMessage)
        then
            Error('The call to the web service failed.');

        if not ResponseMessage.IsSuccessStatusCode then
            error('The web service returned an error message:\' +
                  'Status code: %1' +
                  'Description: %2',
                  ResponseMessage.HttpStatusCode,
                  ResponseMessage.ReasonPhrase);
        
        ResponseMessage.Content.ReadAs(JsonText);
        
        // Process JSON response
        if not JsonArray.ReadFrom(JsonText) then begin
            // probably single object
            JsonToken.ReadFrom(JsonText);
            InsertALIssus(JsonToken);
        end else begin    
            // array
            for i := 0 to JsonArray.Count - 1 do begin
                JsonArray.Get(i,JsonToken);
                InsertALIssus(JsonToken);
            end;
        end;
    end;

    procedure InsertALIssus(JsonToken : JsonToken);
    var
        JsonObject : JsonObject;
        ALIssus : Record ALIssus;
    begin
        JsonObject := JsonToken.AsObject;

        ALIssus.init;
        
        ALIssus."url" := COPYSTR(GetJsonToken(JsonObject,'url').AsValue.AsText, 1, 250);
        ALIssus."repository_url" := COPYSTR(GetJsonToken(JsonObject,'repository_url').AsValue.AsText, 1, 250);
        ALIssus."labels_url" := COPYSTR(GetJsonToken(JsonObject,'labels_url').AsValue.AsText, 1, 250);
        ALIssus."comments_url" := COPYSTR(GetJsonToken(JsonObject,'comments_url').AsValue.AsText, 1, 250);
        ALIssus."events_url" := COPYSTR(GetJsonToken(JsonObject,'events_url').AsValue.AsText, 1, 250);
        ALIssus."html_url" := COPYSTR(GetJsonToken(JsonObject,'html_url').AsValue.AsText, 1, 250);
        ALIssus."id" := GetJsonToken(JsonObject,'id').AsValue.AsInteger;
        ALIssus."node_id" := COPYSTR(GetJsonToken(JsonObject,'node_id').AsValue.AsText, 1, 250);
        ALIssus."number" := GetJsonToken(JsonObject,'number').AsValue.AsInteger;
        ALIssus."title" := COPYSTR(GetJsonToken(JsonObject,'title').AsValue.AsText, 1, 250);
        ALIssus."state" := COPYSTR(GetJsonToken(JsonObject,'state').AsValue.AsText, 1, 250);
        ALIssus."locked" := GetJsonToken(JsonObject,'locked').AsValue.AsBoolean;
        ALIssus."comments" := GetJsonToken(JsonObject,'comments').AsValue.AsInteger;
        ALIssus."created_at" := COPYSTR(GetJsonToken(JsonObject,'created_at').AsValue.AsText, 1, 250);
        ALIssus."updated_at" := COPYSTR(GetJsonToken(JsonObject,'updated_at').AsValue.AsText, 1, 250);
        ALIssus."author_association" := COPYSTR(GetJsonToken(JsonObject,'author_association').AsValue.AsText, 1, 250);
        ALIssus."body" := COPYSTR(GetJsonToken(JsonObject,'body').AsValue.AsText, 1, 250);

        ALIssus.Insert;
    end;

    procedure GetJsonToken(JsonObject:JsonObject;TokenKey:text)JsonToken:JsonToken;
    begin
        if not JsonObject.Get(TokenKey,JsonToken) then
            Error('Could not find a token with key %1',TokenKey);
    end;
    procedure SelectJsonToken(JsonObject:JsonObject;Path:text)JsonToken:JsonToken;
    begin
        if not JsonObject.SelectToken(Path,JsonToken) then
            Error('Could not find a token with path %1',Path);
    end;

}
