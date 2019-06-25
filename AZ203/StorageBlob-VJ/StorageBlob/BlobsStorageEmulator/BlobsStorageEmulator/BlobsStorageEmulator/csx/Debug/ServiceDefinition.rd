<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="BlobsStorageEmulator" generation="1" functional="0" release="0" Id="6c117801-0265-4697-a8af-5f47b6bc2d94" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="BlobsStorageEmulatorGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="BlobStorage.Web:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/BlobsStorageEmulator/BlobsStorageEmulatorGroup/LB:BlobStorage.Web:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="BlobStorage.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/BlobsStorageEmulator/BlobsStorageEmulatorGroup/MapBlobStorage.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="BlobStorage.Web:PhotosStorage" defaultValue="">
          <maps>
            <mapMoniker name="/BlobsStorageEmulator/BlobsStorageEmulatorGroup/MapBlobStorage.Web:PhotosStorage" />
          </maps>
        </aCS>
        <aCS name="BlobStorage.WebInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/BlobsStorageEmulator/BlobsStorageEmulatorGroup/MapBlobStorage.WebInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:BlobStorage.Web:Endpoint1">
          <toPorts>
            <inPortMoniker name="/BlobsStorageEmulator/BlobsStorageEmulatorGroup/BlobStorage.Web/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapBlobStorage.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/BlobsStorageEmulator/BlobsStorageEmulatorGroup/BlobStorage.Web/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapBlobStorage.Web:PhotosStorage" kind="Identity">
          <setting>
            <aCSMoniker name="/BlobsStorageEmulator/BlobsStorageEmulatorGroup/BlobStorage.Web/PhotosStorage" />
          </setting>
        </map>
        <map name="MapBlobStorage.WebInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/BlobsStorageEmulator/BlobsStorageEmulatorGroup/BlobStorage.WebInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="BlobStorage.Web" generation="1" functional="0" release="0" software="D:\Allfiles\Mod09\DemoFiles\BlobsStorageEmulator\BlobsStorageEmulator\csx\Debug\roles\BlobStorage.Web" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="PhotosStorage" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;BlobStorage.Web&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;BlobStorage.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/BlobsStorageEmulator/BlobsStorageEmulatorGroup/BlobStorage.WebInstances" />
            <sCSPolicyUpdateDomainMoniker name="/BlobsStorageEmulator/BlobsStorageEmulatorGroup/BlobStorage.WebUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/BlobsStorageEmulator/BlobsStorageEmulatorGroup/BlobStorage.WebFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="BlobStorage.WebUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="BlobStorage.WebFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="BlobStorage.WebInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="ffcaa4c1-46ee-445c-b1be-f662f09127e8" ref="Microsoft.RedDog.Contract\ServiceContract\BlobsStorageEmulatorContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="8e667034-589f-4636-aebb-207acf5e9248" ref="Microsoft.RedDog.Contract\Interface\BlobStorage.Web:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/BlobsStorageEmulator/BlobsStorageEmulatorGroup/BlobStorage.Web:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>