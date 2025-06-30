import {LogLevel} from "@azure/msal-browser";

export const environment = {
    production: false,
    msalConfig: {
        auth: {
            clientId: 'b3d61384-5b87-4e06-a3a4-8f4f1ad27a8f',
            authority: 'https://login.microsoftonline.com/11394d0f-b180-4b91-86c3-bda58288ece0',
            scopes: ['api://b3d61384-5b87-4e06-a3a4-8f4f1ad27a8f/Crm.Access', 'openid', 'user.read']
        },
        defaultUrl: 'profile',
        logLevel: LogLevel.Verbose
    },
    azureUri: 'https://graph.microsoft.com/v1.0/me',
    apiUri: 'http://localhost:5221'
};