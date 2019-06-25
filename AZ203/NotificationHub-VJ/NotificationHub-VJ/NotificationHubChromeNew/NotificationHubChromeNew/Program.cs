using Microsoft.Azure.NotificationHubs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace NotificationHubChromeNew
{
    class Program
    {
        static void Main(string[] args)
        {

            SendNotificationAsync();
            Console.ReadLine();
        }

        private static async void SendNotificationAsync()
        {
            NotificationHubClient hub = NotificationHubClient.CreateClientFromConnectionString("Endpoint=sb://badriservicebus.servicebus.windows.net/;SharedAccessKeyName=DefaultFullSharedAccessSignature;SharedAccessKey=NcbavkcWTm9g/6ZGEVY31h3ea6KJVj/HQcg8CkIGv80=", "badrinotificationhub");
            String message = "{\"data\":{\"message\":\"Hello from Vatan!!!\"}}";
            await hub.SendFcmNativeNotificationAsync(message);
        }
    }
}
