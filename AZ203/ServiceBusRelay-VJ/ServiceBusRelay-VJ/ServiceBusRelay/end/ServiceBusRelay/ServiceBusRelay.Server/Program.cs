using ServiceBusRelay.Contract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using Microsoft.ServiceBus;

namespace ServiceBusRelay.Server
{
    class Program
    {
        static void Main(string[] args)
        {
            ServiceHost host = new ServiceHost(typeof(ConsoleService), 
                new Uri("sb://infosysrelay-vatan.servicebus.windows.net"));
            var endpoint = host.AddServiceEndpoint(typeof(IConsoleService), new NetTcpRelayBinding(), "console");
            endpoint.Behaviors.Add(new TransportClientEndpointBehavior
            {
                TokenProvider = TokenProvider.CreateSharedAccessSignatureTokenProvider("RootManageSharedAccessKey", "Sn923qTYAXFFj4XDbopv8ghvcE83+C1b8oGE+hdYf3I=")
            });

            host.Open();

            Console.WriteLine("The server is running");
            Console.ReadKey();
            host.Close();
        }
    }
}
