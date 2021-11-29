Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D024460E4C
	for <lists+linux-nfc@lfdr.de>; Mon, 29 Nov 2021 06:06:38 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 622D1100EA2D8;
	Sun, 28 Nov 2021 21:06:34 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C70C1100EB330
	for <linux-nfc@lists.01.org>; Sun, 28 Nov 2021 21:06:31 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id E18293200A2E;
	Mon, 29 Nov 2021 00:06:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 29 Nov 2021 00:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=m+14RCaR8Kh+Z
	rmmkFllyNGqbh+kBbYKGzLyIlui8es=; b=Fdw5A4Lul4OMlRlWQa3o0Lrb3AQ9Y
	0nCyZiL1aZwkgPF+3j7hs5RAs0DjF/xwmTKM0bZkqNel+h4LytuSc1hDwD3i9ynD
	YB33t0nC7HtoW9rteTWmzKuzO+pSFuy6yYAqeo1WaDtxTNr2eJB4vCy39HGqm3FD
	Yhq1q+8aKKFYKOE53BEKVKQ9g6FxVslYfbnhPWZ0HeRzAVM0ago75CzToUZ1Y9Tj
	7FA67jsAsNiJjgjfqQgwIs0725s9GMYtddpxiRHLGNvd2aND5WeeC2jncM9CHdHO
	15lPHXdD8XaAD3vD0Gmklzf7Tkw0efQGScRI22YPjcaJ8VJjvkzxPVZcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=m+14RCaR8Kh+ZrmmkFllyNGqbh+kBbYKGzLyIlui8es=; b=UUZDvlPO
	dBAicU4g516cZTMxsha446M2kF10wWdysw+IDfZ8wt7fVzCTgFSNBS49xCK2AMeU
	/k9foEzZ+J973FLfUkj/dzvMsGaxQ26SME4UD7DODZRbXWWtlYaYtwgyLDOkKUnT
	BPb2fJwbNDYZ4xXH/ntpveVfFudAwJF/BgRXs1W54DOLmc4E6CyUGoi2mSXcyD6S
	6f5PFcnh0k+7oWwYSOlGPkpIrrssiAH52Jcn+nBo+hpPB2AjFVtfAspHlhPsvm9K
	fqbmdR3g/VQ8il1MXpAfwe+urqAJ4HBZRE0L7ZTwnUhe7JFtsHVDWsc0J+DBfi5P
	CEMczjpqU0YFGA==
X-ME-Sender: <xms:1l-kYWJumhkiUgkaljuv6N2qY0TGNTd7yE5tsMB9r9R_CR2ig9WOOQ>
    <xme:1l-kYeInO6x6BSmTvCKSBgD6Kq1iQAjPXPVmWrbao_OpXsdLRxB9nrX2weO1SMwcr
    dmg6W0HfgC-mTPrXg>
X-ME-Received: <xmr:1l-kYWtfvTLTh9qiZsVRz1uyUyIBFShV6U7rhnH7AIoKDjjXLV6MEBPUtUyyl4HUB7WeNRmh-AMDKv6iMNqBT6JJTYX4yZynznRk9CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforghrkhcuifhrvggvrhcuoehmghhrvggvrh
    esrghnihhmrghltghrvggvkhdrtghomheqnecuggftrfgrthhtvghrnhepfeefteffffet
    keduuefgheelhffhffffjedvgeetgfejheeuvdelheekhfetueeknecuffhomhgrihhnpe
    hshihsthgvmhgsuhhsrdifrghttghhpdhnvggrrhguughirghlohhgrdhshhhofidpshgv
    rhhvvghrrdhruhhnpdhnfhgtqdhfohhruhhmrdhorhhgpdhnfhgtqdhfohhruhhmrdgtoh
    hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhg
    rhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:1l-kYbYu48OxrtJJMTULdUu_I4dxFubDiLJJfrrPJm4skkY2wwXOcQ>
    <xmx:1l-kYdYrvqNCd3R0zShOk3EboiaiDxx3jaThsHOklLOwywmJSUp8Gg>
    <xmx:1l-kYXCKiRFgHK_vh23lBnqzrEgd05UPdug6-Vy6jEMDWygnIsWmxg>
    <xmx:1l-kYcwa8T8yyCl0OfjTFFVxq5q6EAXCVfRoveOPhsgoPUnCQb-W4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 00:06:29 -0500 (EST)
Received: from blue.animalcreek.com (localhost [127.0.0.1])
	by blue.animalcreek.com (Postfix) with ESMTP id 2D5FD13604A9;
	Sun, 28 Nov 2021 22:06:29 -0700 (MST)
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Date: Sun, 28 Nov 2021 22:06:03 -0700
Message-Id: <20211129050606.873494-4-mgreer@animalcreek.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211129050606.873494-1-mgreer@animalcreek.com>
References: <20211129050606.873494-1-mgreer@animalcreek.com>
MIME-Version: 1.0
Message-ID-Hash: R246UXMYNM2Y3FNP36S2YY43FKA5EPQ6
X-Message-ID-Hash: R246UXMYNM2Y3FNP36S2YY43FKA5EPQ6
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 3/6] test: Reformat Python test scripts
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/R246UXMYNM2Y3FNP36S2YY43FKA5EPQ6/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reformat the Python-based test scripts using the "Prettier"
beautifiers (default options). This brings the code closer to
conformance with the PEP 8 style guide.

Signed-off-by: Mark Greer <mgreer@animalcreek.com>
---
 test/bt-handover         | 249 ++++++++++++++++++--------------
 test/handover-agent      | 284 +++++++++++++++++++++---------------
 test/monitor-near        |  76 +++++-----
 test/ndef-agent          | 112 +++++++--------
 test/neard-ui.py         | 304 +++++++++++++++++++++------------------
 test/neardutils.py       | 138 ++++++++++--------
 test/phdc-simple-manager | 228 +++++++++++++++--------------
 test/test-adapter        | 156 ++++++++++----------
 test/test-device         | 218 ++++++++++++++++------------
 test/test-tag            | 204 +++++++++++++-------------
 10 files changed, 1076 insertions(+), 893 deletions(-)

diff --git a/test/bt-handover b/test/bt-handover
index eebae9338e00..468e58cb18a8 100755
--- a/test/bt-handover
+++ b/test/bt-handover
@@ -13,119 +13,152 @@ from dbus.lowlevel import MethodCallMessage, HANDLER_RESULT_NOT_YET_HANDLED
 
 mainloop = gobject.MainLoop()
 
-def device_added(path, interfaces):
-        for iface, props in interfaces.items():
-                if "org.neard.Device" in interfaces:
-                        print("Pairing with %s" % (path))
-                        device = dbus.Interface(bus.get_object("org.neard", path),
-                                                        "org.neard.Device")
-                        device.Push(({ "Type" : "Handover", "Carrier" : "bluetooth"}))
-                        break
-
-def device_removed(path, interfaces):
-        for iface in interfaces:
-                if "org.neard.Device" in interfaces:
-                        print("Lost device %s" % (path))
-                        mainloop.quit()
-                        break
-
-def remove_paired_devices(bt_adapter):
-        manager = dbus.Interface(bus.get_object("org.bluez", "/"),
-                                        "org.freedesktop.DBus.ObjectManager")
-        objects = manager.GetManagedObjects()
 
-        all_adapters = (path for path, interfaces in objects.items() if
-                                "org.bluez.Adapter1" in interfaces.keys()
-                                and path.endswith(bt_adapter))
-
-        bluez_adapter = None
-        for adapter in sorted(all_adapters):
-                bluez_adapter = dbus.Interface(bus.get_object("org.bluez",
-                                                        adapter),
-                                                        "org.bluez.Adapter1")
-                break
-
-        if(bluez_adapter is None):
-                print("Bluetooth adapter %s could not be found" % bluez_adapter)
-                exit()
+def device_added(path, interfaces):
+    for iface, props in interfaces.items():
+        if "org.neard.Device" in interfaces:
+            print("Pairing with %s" % (path))
+            device = dbus.Interface(
+                bus.get_object("org.neard", path), "org.neard.Device"
+            )
+            device.Push(({"Type": "Handover", "Carrier": "bluetooth"}))
+            break
 
-        adapter_path = bluez_adapter.object_path
-        print("Using %s" % adapter_path)
 
-        adapter_props = dbus.Interface(bus.get_object("org.bluez", adapter_path),
-                                        "org.freedesktop.DBus.Properties")
+def device_removed(path, interfaces):
+    for iface in interfaces:
+        if "org.neard.Device" in interfaces:
+            print("Lost device %s" % (path))
+            mainloop.quit()
+            break
 
-        powered = adapter_props.Get("org.bluez.Adapter1", "Powered")
-        if (powered == dbus.Boolean(0)):
-                print("Bluetooth adapter %s is not powered" % adapter_path )
-                exit()
 
-        all_devices = (path for path, interfaces in objects.items() if
-                                ("org.bluez.Device1" in interfaces.keys()
-                                and path.startswith(bluez_adapter.object_path)))
+def remove_paired_devices(bt_adapter):
+    manager = dbus.Interface(
+        bus.get_object("org.bluez", "/"), "org.freedesktop.DBus.ObjectManager"
+    )
+    objects = manager.GetManagedObjects()
+
+    all_adapters = (
+        path
+        for path, interfaces in objects.items()
+        if "org.bluez.Adapter1" in interfaces.keys() and path.endswith(bt_adapter)
+    )
+
+    bluez_adapter = None
+    for adapter in sorted(all_adapters):
+        bluez_adapter = dbus.Interface(
+            bus.get_object("org.bluez", adapter), "org.bluez.Adapter1"
+        )
+        break
+
+    if bluez_adapter is None:
+        print("Bluetooth adapter %s could not be found" % bluez_adapter)
+        exit()
+
+    adapter_path = bluez_adapter.object_path
+    print("Using %s" % adapter_path)
+
+    adapter_props = dbus.Interface(
+        bus.get_object("org.bluez", adapter_path), "org.freedesktop.DBus.Properties"
+    )
+
+    powered = adapter_props.Get("org.bluez.Adapter1", "Powered")
+    if powered == dbus.Boolean(0):
+        print("Bluetooth adapter %s is not powered" % adapter_path)
+        exit()
+
+    all_devices = (
+        path
+        for path, interfaces in objects.items()
+        if (
+            "org.bluez.Device1" in interfaces.keys()
+            and path.startswith(bluez_adapter.object_path)
+        )
+    )
+
+    for device in all_devices:
+        print("Removing %s" % (device))
+        bluez_adapter.RemoveDevice(device)
 
-        for device in all_devices:
-                print("Removing %s" % (device))
-                bluez_adapter.RemoveDevice(device)
 
 def remove_paired_devices_bluez4():
-        bluez_manager = dbus.Interface(bus.get_object("org.bluez", "/"),
-                                        "org.bluez.Manager")
-
-        bluez_adapter_path = bluez_manager.DefaultAdapter()
-        bluez_adapter = dbus.Interface(bus.get_object("org.bluez",
-                                                bluez_adapter_path),
-                                                "org.bluez.Adapter")
-
-        print("Using %s" % bluez_adapter.object_path)
-
-        for bluez_path in bluez_adapter.ListDevices():
-                print("Removing %s" % (bluez_path))
-                bluez_adapter.RemoveDevice(bluez_path)
-
-if __name__ == '__main__':
-        parser = OptionParser()
-        parser.add_option("", "--bluez4", action="store_true",
-                                dest="use_bluez4",
-                                help="Use BlueZ 4 to remove paired devices.")
-        parser.add_option("-a", "--adapter", metavar="BT_ADAPTER",
-                                dest="bt_adapter", default="",
-                                help="The bluetooth adapter that is used by "
-                                        "the bluetooth stack. This options is "
-                                        "ignored when using BlueZ 4, instead "
-                                        "the default adapter is used.")
-        (options, args) = parser.parse_args()
-
-        dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
-
-        bus = dbus.SystemBus()
-
-        adapter_path = neardutils.find_adapter().object_path
-        print("Adapter path %s" % (adapter_path))
-        adapter = dbus.Interface(bus.get_object("org.neard", adapter_path),
-                                                        "org.neard.Adapter")
-
-        adapter_props = dbus.Interface(bus.get_object("org.neard", adapter_path),
-                                        "org.freedesktop.DBus.Properties")
-        powered = adapter_props.Get("org.neard.Adapter", "Powered")
-        if (powered == dbus.Boolean(0)):
-                adapter_props.Set("org.neard.Adapter", "Powered", dbus.Boolean(1))
-
-        if (options.use_bluez4):
-                remove_paired_devices_bluez4()
-        else:
-                remove_paired_devices(options.bt_adapter)
-
-        polling = adapter_props.Get("org.neard.Adapter", "Polling")
-        if (polling == dbus.Boolean(0)):
-                adapter.StartPollLoop("Initiator")
-
-        bus.add_signal_receiver(device_added, bus_name="org.neard",
-                        dbus_interface="org.freedesktop.DBus.ObjectManager",
-                        signal_name="InterfacesAdded")
-
-        bus.add_signal_receiver(device_removed, bus_name="org.neard",
-                        dbus_interface="org.freedesktop.DBus.ObjectManager",
-                        signal_name="InterfacesRemoved")
-
-        mainloop.run()
+    bluez_manager = dbus.Interface(
+        bus.get_object("org.bluez", "/"), "org.bluez.Manager"
+    )
+
+    bluez_adapter_path = bluez_manager.DefaultAdapter()
+    bluez_adapter = dbus.Interface(
+        bus.get_object("org.bluez", bluez_adapter_path), "org.bluez.Adapter"
+    )
+
+    print("Using %s" % bluez_adapter.object_path)
+
+    for bluez_path in bluez_adapter.ListDevices():
+        print("Removing %s" % (bluez_path))
+        bluez_adapter.RemoveDevice(bluez_path)
+
+
+if __name__ == "__main__":
+    parser = OptionParser()
+    parser.add_option(
+        "",
+        "--bluez4",
+        action="store_true",
+        dest="use_bluez4",
+        help="Use BlueZ 4 to remove paired devices.",
+    )
+    parser.add_option(
+        "-a",
+        "--adapter",
+        metavar="BT_ADAPTER",
+        dest="bt_adapter",
+        default="",
+        help="The bluetooth adapter that is used by "
+        "the bluetooth stack. This options is "
+        "ignored when using BlueZ 4, instead "
+        "the default adapter is used.",
+    )
+    (options, args) = parser.parse_args()
+
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+
+    bus = dbus.SystemBus()
+
+    adapter_path = neardutils.find_adapter().object_path
+    print("Adapter path %s" % (adapter_path))
+    adapter = dbus.Interface(
+        bus.get_object("org.neard", adapter_path), "org.neard.Adapter"
+    )
+
+    adapter_props = dbus.Interface(
+        bus.get_object("org.neard", adapter_path), "org.freedesktop.DBus.Properties"
+    )
+    powered = adapter_props.Get("org.neard.Adapter", "Powered")
+    if powered == dbus.Boolean(0):
+        adapter_props.Set("org.neard.Adapter", "Powered", dbus.Boolean(1))
+
+    if options.use_bluez4:
+        remove_paired_devices_bluez4()
+    else:
+        remove_paired_devices(options.bt_adapter)
+
+    polling = adapter_props.Get("org.neard.Adapter", "Polling")
+    if polling == dbus.Boolean(0):
+        adapter.StartPollLoop("Initiator")
+
+    bus.add_signal_receiver(
+        device_added,
+        bus_name="org.neard",
+        dbus_interface="org.freedesktop.DBus.ObjectManager",
+        signal_name="InterfacesAdded",
+    )
+
+    bus.add_signal_receiver(
+        device_removed,
+        bus_name="org.neard",
+        dbus_interface="org.freedesktop.DBus.ObjectManager",
+        signal_name="InterfacesRemoved",
+    )
+
+    mainloop.run()
diff --git a/test/handover-agent b/test/handover-agent
index bed79a87cf09..5efc55ac6efd 100755
--- a/test/handover-agent
+++ b/test/handover-agent
@@ -7,134 +7,180 @@ import dbus.service
 import dbus.mainloop.glib
 from optparse import OptionParser
 
-eir_test_data = [0x16,0x00\
-                ,0x01,0x02,0x03,0x04,0x05,0x06\
-                ,0x08,0x09,0x41,0x72,0x72,0x61,0x6b,0x69,0x73\
-                ,0x04,0x0d,0x6e,0x01,0x00]
-
-wsc_test_data = [0x10,0x4A,0x00,0x01,0x10\
-                ,0x10,0x45,0x00,0x08\
-                ,0x74,0x65,0x73,0x74,0x73,0x73,0x69,0x64\
-                ,0x10,0x27,0x00,0x06\
-                ,0x62,0x6C,0x61,0x62,0x6C,0x61]
+eir_test_data = [
+    0x16,
+    0x00,
+    0x01,
+    0x02,
+    0x03,
+    0x04,
+    0x05,
+    0x06,
+    0x08,
+    0x09,
+    0x41,
+    0x72,
+    0x72,
+    0x61,
+    0x6B,
+    0x69,
+    0x73,
+    0x04,
+    0x0D,
+    0x6E,
+    0x01,
+    0x00,
+]
+
+wsc_test_data = [
+    0x10,
+    0x4A,
+    0x00,
+    0x01,
+    0x10,
+    0x10,
+    0x45,
+    0x00,
+    0x08,
+    0x74,
+    0x65,
+    0x73,
+    0x74,
+    0x73,
+    0x73,
+    0x69,
+    0x64,
+    0x10,
+    0x27,
+    0x00,
+    0x06,
+    0x62,
+    0x6C,
+    0x61,
+    0x62,
+    0x6C,
+    0x61,
+]
 
 power_state = None
 
+
 def print_fields(fields):
-        if 'EIR' in fields:
-                s = ' '.join('{:#02x}'.format(i) for i in fields['EIR'])
-                print('  EIR:  %s' % s)
+    if "EIR" in fields:
+        s = " ".join("{:#02x}".format(i) for i in fields["EIR"])
+        print("  EIR:  %s" % s)
+
+    if "nokia.com:bt" in fields:
+        s = " ".join("{:#02x}".format(i) for i in fields["nokia.com:bt"])
+        print("  nokia.com:bt:  %s" % s)
 
-        if 'nokia.com:bt' in fields:
-                s = ' '.join('{:#02x}'.format(i) for i in fields['nokia.com:bt'])
-                print('  nokia.com:bt:  %s' % s)
+    if "State" in fields:
+        print("  State: %s" % fields["State"])
 
-        if 'State' in fields:
-                print('  State: %s' % fields['State'])
+    if "WSC" in fields:
+        s = " ".join("{:#02x}".format(i) for i in fields["WSC"])
+        print("  WSC:  %s" % s)
 
-        if 'WSC' in fields:
-                s = ' '.join('{:#02x}'.format(i) for i in fields['WSC'])
-                print('  WSC:  %s' % s)
 
 class BTHOAgent(dbus.service.Object):
+    @dbus.service.method("org.neard.HandoverAgent", in_signature="", out_signature="")
+    def Release(self):
+        print("Release")
+        mainloop.quit()
+
+    @dbus.service.method(
+        "org.neard.HandoverAgent", in_signature="a{sv}", out_signature=""
+    )
+    def PushOOB(self, fields):
+        print("PushOOB")
+        print_fields(fields)
+
+    @dbus.service.method(
+        "org.neard.HandoverAgent", in_signature="a{sv}", out_signature="a{sv}"
+    )
+    def RequestOOB(self, fields):
+        print("RequestOOB")
+        print_fields(fields)
+
+        print("  Replying with")
+        s = " ".join("{:#02x}".format(i) for i in eir_test_data)
+        print("    EIR: %s" % s)
+
+        if power_state != "unknown":
+            print("    State: %s" % power_state)
+            return {"EIR": eir_test_data, "State": power_state}
+        else:
+            return {"EIR": eir_test_data}
 
-        @dbus.service.method('org.neard.HandoverAgent',
-                                        in_signature='',
-                                        out_signature='')
-        def Release(self):
-                print('Release')
-                mainloop.quit()
-
-        @dbus.service.method('org.neard.HandoverAgent',
-                                        in_signature='a{sv}',
-                                        out_signature='')
-        def PushOOB(self, fields):
-                print('PushOOB')
-                print_fields(fields)
-
-        @dbus.service.method('org.neard.HandoverAgent',
-                                        in_signature='a{sv}',
-                                        out_signature='a{sv}')
-
-        def RequestOOB(self, fields):
-                print('RequestOOB')
-                print_fields(fields)
-
-                print('  Replying with')
-                s = ' '.join('{:#02x}'.format(i) for i in eir_test_data)
-                print('    EIR: %s' % s)
-
-                if power_state != 'unknown':
-                        print('    State: %s' % power_state)
-                        return {'EIR' : eir_test_data, 'State' : power_state}
-                else:
-                        return {'EIR' : eir_test_data}
 
 class WiFiHOAgent(dbus.service.Object):
-
-        @dbus.service.method('org.neard.HandoverAgent',
-                                        in_signature='',
-                                        out_signature='')
-        def Release(self):
-                print('Release')
-                mainloop.quit()
-
-        @dbus.service.method('org.neard.HandoverAgent',
-                                        in_signature='a{sv}',
-                                        out_signature='')
-        def PushOOB(self, fields):
-                print('PushOOB')
-                print_fields(fields)
-
-        @dbus.service.method('org.neard.HandoverAgent',
-                                        in_signature='a{sv}',
-                                        out_signature='a{sv}')
-
-        def RequestOOB(self, fields):
-                print('RequestOOB')
-                print_fields(fields)
-
-                print('  Replying with')
-                s = ' '.join('{:#02x}'.format(i) for i in wsc_test_data)
-                print('    WSC: %s' % s)
-
-                if power_state != 'unknown':
-                        print('    State: %s' % power_state)
-                        return {'WSC' : wsc_test_data, 'State' : power_state}
-                else:
-                        return {'WSC' : wsc_test_data}
-
-if __name__ == '__main__':
-        dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
-
-        bus = dbus.SystemBus()
-
-        parser = OptionParser()
-        parser.add_option("-s", "--power-state", action="store", type="string",
-                                dest="power_state", default="active",
-                                help="active inactive activating unknown")
-        (options, args) = parser.parse_args()
-
-        power_state = options.power_state
-
-        obj = bus.get_object("org.neard", "/org/neard");
-        manager = dbus.Interface(obj, "org.neard.AgentManager")
-
-        btpath = '/test/handover/bt/agent'
-        btcarrier = 'bluetooth'
-        btobject = BTHOAgent(bus, btpath)
-
-        wifipath = '/test/handover/wifi/agent'
-        wificarrier = 'wifi'
-        wifiobject = WiFiHOAgent(bus, wifipath)
-
-        manager.RegisterHandoverAgent(btpath, btcarrier)
-        manager.RegisterHandoverAgent(wifipath, wificarrier)
-
-        mainloop = gobject.MainLoop()
-
-        try:
-                mainloop.run()
-        except (KeyboardInterrupt):
-                manager.UnregisterHandoverAgent(btpath, btcarrier)
-                manager.UnregisterHandoverAgent(wifipath, wificarrier)
+    @dbus.service.method("org.neard.HandoverAgent", in_signature="", out_signature="")
+    def Release(self):
+        print("Release")
+        mainloop.quit()
+
+    @dbus.service.method(
+        "org.neard.HandoverAgent", in_signature="a{sv}", out_signature=""
+    )
+    def PushOOB(self, fields):
+        print("PushOOB")
+        print_fields(fields)
+
+    @dbus.service.method(
+        "org.neard.HandoverAgent", in_signature="a{sv}", out_signature="a{sv}"
+    )
+    def RequestOOB(self, fields):
+        print("RequestOOB")
+        print_fields(fields)
+
+        print("  Replying with")
+        s = " ".join("{:#02x}".format(i) for i in wsc_test_data)
+        print("    WSC: %s" % s)
+
+        if power_state != "unknown":
+            print("    State: %s" % power_state)
+            return {"WSC": wsc_test_data, "State": power_state}
+        else:
+            return {"WSC": wsc_test_data}
+
+
+if __name__ == "__main__":
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+
+    bus = dbus.SystemBus()
+
+    parser = OptionParser()
+    parser.add_option(
+        "-s",
+        "--power-state",
+        action="store",
+        type="string",
+        dest="power_state",
+        default="active",
+        help="active inactive activating unknown",
+    )
+    (options, args) = parser.parse_args()
+
+    power_state = options.power_state
+
+    obj = bus.get_object("org.neard", "/org/neard")
+    manager = dbus.Interface(obj, "org.neard.AgentManager")
+
+    btpath = "/test/handover/bt/agent"
+    btcarrier = "bluetooth"
+    btobject = BTHOAgent(bus, btpath)
+
+    wifipath = "/test/handover/wifi/agent"
+    wificarrier = "wifi"
+    wifiobject = WiFiHOAgent(bus, wifipath)
+
+    manager.RegisterHandoverAgent(btpath, btcarrier)
+    manager.RegisterHandoverAgent(wifipath, wificarrier)
+
+    mainloop = gobject.MainLoop()
+
+    try:
+        mainloop.run()
+    except (KeyboardInterrupt):
+        manager.UnregisterHandoverAgent(btpath, btcarrier)
+        manager.UnregisterHandoverAgent(wifipath, wificarrier)
diff --git a/test/monitor-near b/test/monitor-near
index d6cd24f9f64f..7211b6ab477c 100755
--- a/test/monitor-near
+++ b/test/monitor-near
@@ -5,40 +5,52 @@ import gobject
 import dbus
 import dbus.mainloop.glib
 
-def property_changed(interface, changed, invalidated, path):
-        iface = interface[interface.rfind(".") + 1:]
-        for name, value in changed.items():
-                val = str(value)
-                print("{%s.PropertyChanged} [%s] %s = %s" % (iface, path, name,
-                                                                        val))
-
-def interfaces_added(path, interfaces):
-        for iface, props in interfaces.items():
-                print("{Added %s} [%s]" % (iface, path))
-                for name, value in props.items():
-                        print("      %s = %s" % (name, value))
-
-def interfaces_removed(path, interfaces):
-        for iface in interfaces:
-                print("{Removed %s} [%s]" % (iface, path))
 
-if __name__ == '__main__':
-        dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
-
-        bus = dbus.SystemBus()
+def property_changed(interface, changed, invalidated, path):
+    iface = interface[interface.rfind(".") + 1 :]
+    for name, value in changed.items():
+        val = str(value)
+        print("{%s.PropertyChanged} [%s] %s = %s" % (iface, path, name, val))
 
-        bus.add_signal_receiver(property_changed, bus_name="org.neard",
-                        dbus_interface="org.freedesktop.DBus.Properties",
-                        signal_name="PropertiesChanged",
-                        path_keyword="path")
 
-        bus.add_signal_receiver(interfaces_added, bus_name="org.neard",
-                        dbus_interface="org.freedesktop.DBus.ObjectManager",
-                        signal_name="InterfacesAdded")
+def interfaces_added(path, interfaces):
+    for iface, props in interfaces.items():
+        print("{Added %s} [%s]" % (iface, path))
+        for name, value in props.items():
+            print("      %s = %s" % (name, value))
 
-        bus.add_signal_receiver(interfaces_removed, bus_name="org.neard",
-                        dbus_interface="org.freedesktop.DBus.ObjectManager",
-                        signal_name="InterfacesRemoved")
 
-        mainloop = gobject.MainLoop()
-        mainloop.run()
+def interfaces_removed(path, interfaces):
+    for iface in interfaces:
+        print("{Removed %s} [%s]" % (iface, path))
+
+
+if __name__ == "__main__":
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+
+    bus = dbus.SystemBus()
+
+    bus.add_signal_receiver(
+        property_changed,
+        bus_name="org.neard",
+        dbus_interface="org.freedesktop.DBus.Properties",
+        signal_name="PropertiesChanged",
+        path_keyword="path",
+    )
+
+    bus.add_signal_receiver(
+        interfaces_added,
+        bus_name="org.neard",
+        dbus_interface="org.freedesktop.DBus.ObjectManager",
+        signal_name="InterfacesAdded",
+    )
+
+    bus.add_signal_receiver(
+        interfaces_removed,
+        bus_name="org.neard",
+        dbus_interface="org.freedesktop.DBus.ObjectManager",
+        signal_name="InterfacesRemoved",
+    )
+
+    mainloop = gobject.MainLoop()
+    mainloop.run()
diff --git a/test/ndef-agent b/test/ndef-agent
index 72fcecf9d3a1..cb62ecd8c840 100755
--- a/test/ndef-agent
+++ b/test/ndef-agent
@@ -7,72 +7,70 @@ import dbus.service
 import dbus.mainloop.glib
 import sys
 
+
 class NDEFAgent(dbus.service.Object):
+    @dbus.service.method("org.neard.NDEFAgent", in_signature="", out_signature="")
+    def Release(self):
+        print("Release")
+        mainloop.quit()
+
+    @dbus.service.method("org.neard.NDEFAgent", in_signature="a{sv}", out_signature="")
+    def GetNDEF(self, fields):
+        print("GetNDEF")
+
+        if fields.has_key("Record"):
+            print("Record path %s" % (fields["Record"]))
+
+        if fields.has_key("Payload"):
+            val = "["
+            for i in fields["Payload"]:
+                val += " 0x%x" % i
+            val += " ]"
+            print("Record payload %s" % val)
+
+        if fields.has_key("NDEF"):
+            val = "["
+            for i in fields["NDEF"]:
+                val += " 0x%x" % i
+            val += " ]"
+            print("Complete NDEF %s" % val)
+
+        return
+
+    @dbus.service.method("org.neard.NDEFAgent", in_signature="", out_signature="")
+    def Cancel(self):
+        print("Cancel")
 
-        @dbus.service.method("org.neard.NDEFAgent",
-                                        in_signature='', out_signature='')
-        def Release(self):
-                print("Release")
-                mainloop.quit()
-
-        @dbus.service.method("org.neard.NDEFAgent",
-                                        in_signature='a{sv}',
-                                        out_signature='')
-        def GetNDEF(self, fields):
-                print("GetNDEF")
-
-                if fields.has_key("Record"):
-                        print("Record path %s" % (fields["Record"]))
-
-                if fields.has_key("Payload"):
-                        val = "["
-                        for i in fields["Payload"]:
-                                val += " 0x%x" % i
-                        val += " ]"
-                        print("Record payload %s" % val)
-
-                if fields.has_key("NDEF"):
-                        val = "["
-                        for i in fields["NDEF"]:
-                                val += " 0x%x" % i
-                        val += " ]"
-                        print("Complete NDEF %s" % val)
-
-                return
-
-        @dbus.service.method("org.neard.NDEFAgent",
-                                        in_signature='', out_signature='')
-        def Cancel(self):
-                print("Cancel")
 
 def print_usage():
-        print("Usage:")
-        print("%s Type=<record type>" % (sys.argv[0]))
-        print("Help: %s help" % (sys.argv[0]))
-        sys.exit(1)
+    print("Usage:")
+    print("%s Type=<record type>" % (sys.argv[0]))
+    print("Help: %s help" % (sys.argv[0]))
+    sys.exit(1)
+
 
-if __name__ == '__main__':
-        if len(sys.argv) != 2:
-                print_usage()
+if __name__ == "__main__":
+    if len(sys.argv) != 2:
+        print_usage()
 
-        if len(sys.argv) == 2 and sys.argv[1] == "help":
-                print_usage()
+    if len(sys.argv) == 2 and sys.argv[1] == "help":
+        print_usage()
 
-        dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
 
-        bus = dbus.SystemBus()
-        obj = bus.get_object("org.neard", "/org/neard");
-        manager = dbus.Interface(obj, "org.neard.AgentManager")
+    bus = dbus.SystemBus()
+    obj = bus.get_object("org.neard", "/org/neard")
+    manager = dbus.Interface(obj, "org.neard.AgentManager")
 
-        path = "/test/ndef/agent"
-        object = NDEFAgent(bus, path)
-        rec_type = sys.argv[1].replace("Type=", "", 1)
+    path = "/test/ndef/agent"
+    object = NDEFAgent(bus, path)
+    rec_type = sys.argv[1].replace("Type=", "", 1)
 
-        manager.RegisterNDEFAgent(path, rec_type)
+    manager.RegisterNDEFAgent(path, rec_type)
 
-        mainloop = gobject.MainLoop()
+    mainloop = gobject.MainLoop()
 
-        try:
-                mainloop.run()
-        except (KeyboardInterrupt):
-                manager.UnregisterNDEFAgent(path, rec_type)
+    try:
+        mainloop.run()
+    except (KeyboardInterrupt):
+        manager.UnregisterNDEFAgent(path, rec_type)
diff --git a/test/neard-ui.py b/test/neard-ui.py
index e960891eccf0..bb6ae3ad4c1e 100755
--- a/test/neard-ui.py
+++ b/test/neard-ui.py
@@ -16,7 +16,6 @@ import neardutils
 
 ##=================================================================
 class Neard:
-
     def interface_Added(self, path, interface):
         print(" New interface added: %s" % path)
         self.objects = neardutils.get_managed_objects()
@@ -27,25 +26,30 @@ class Neard:
         self.objects = neardutils.get_managed_objects()
         self.interface_updateDetails(interface)
 
-
-    #connect to the object_manager in order to be notified on
-    #add/remove interface
+    # connect to the object_manager in order to be notified on
+    # add/remove interface
     def interfaces_Connect(self):
         try:
-            print('interfaces_Connect')
+            print("interfaces_Connect")
             bus = dbus.SystemBus()
             self.objects = neardutils.get_managed_objects()
-            bus.add_signal_receiver(self.interface_Added, bus_name=neardutils.SERVICE_NAME,
-                                    dbus_interface="org.freedesktop.DBus.ObjectManager",
-                                    signal_name="InterfacesAdded")
-            bus.add_signal_receiver(self.interface_Removed, bus_name=neardutils.SERVICE_NAME,
-                                    dbus_interface="org.freedesktop.DBus.ObjectManager",
-                                    signal_name="InterfacesRemoved")
+            bus.add_signal_receiver(
+                self.interface_Added,
+                bus_name=neardutils.SERVICE_NAME,
+                dbus_interface="org.freedesktop.DBus.ObjectManager",
+                signal_name="InterfacesAdded",
+            )
+            bus.add_signal_receiver(
+                self.interface_Removed,
+                bus_name=neardutils.SERVICE_NAME,
+                dbus_interface="org.freedesktop.DBus.ObjectManager",
+                signal_name="InterfacesRemoved",
+            )
         except:
-            print("Can't connect to org.freedesktop.DBus.ObjectManager");
+            print("Can't connect to org.freedesktop.DBus.ObjectManager")
             self.objects = None
 
-        #Retrieve the manager informations
+        # Retrieve the manager informations
         self.interface_getDetails()
 
     def interface_getDetails(self):
@@ -59,7 +63,7 @@ class Neard:
         elif neardutils.RECORD_INTERFACE in interface:
             self.record_updateDetails(path)
 
-    def adapter_PropertyChanged(self, prop, value, adapt_path = None):
+    def adapter_PropertyChanged(self, prop, value, adapt_path=None):
         print("Prop changed: %s" % prop)
         adapt_properties = {}
         adapt_properties[prop] = value
@@ -68,7 +72,7 @@ class Neard:
         else:
             self.adapter_update(adapt_path, adapt_properties)
 
-    #Update the records UI
+    # Update the records UI
     def record_updateDetails(self, tag_path=None):
         if tag_path is not None:
             for record_path, record_iface in self.objects.items():
@@ -85,7 +89,7 @@ class Neard:
         else:
             self.records_update()
 
-    #Update the tags UI
+    # Update the tags UI
     def tag_updateDetails(self, adapter_path=None):
         if adapter_path is not None:
             for tag_path, interfaces in self.objects.items():
@@ -99,35 +103,33 @@ class Neard:
                 self.tagregistered[tag_path] = True
                 # call UI update
                 self.tags_update(tag_path, tag_properties)
-                #Process the records
+                # Process the records
                 self.record_updateDetails(tag_properties)
         else:
             print("remove tags and records")
             self.tags_update()
             self.records_update()
 
-
-    #Something changed, must update the UI
+    # Something changed, must update the UI
     def adapter_updateDetails(self):
         for adapt_path, interfaces in self.objects.items():
             if neardutils.ADAPTER_INTERFACE not in interfaces:
-                   continue
+                continue
 
             if adapt_path in self.adaptregistered:
-                   print(" already registered %s" % adapt_path)
+                print(" already registered %s" % adapt_path)
             else:
-                   adapt_properties = interfaces[neardutils.ADAPTER_INTERFACE]
-
-                   self.adaptregistered[adapt_path] = True
+                adapt_properties = interfaces[neardutils.ADAPTER_INTERFACE]
 
-                   #Update display info
-                   self.adapter_update(adapt_path, adapt_properties)
+                self.adaptregistered[adapt_path] = True
 
-                   #udpate UI for tags
-                   self.tag_updateDetails()
+                # Update display info
+                self.adapter_update(adapt_path, adapt_properties)
 
+                # udpate UI for tags
+                self.tag_updateDetails()
 
-    #Search DBUS to find any neard instance
+    # Search DBUS to find any neard instance
     def neardNameOwnerChanged(self, proxy):
         if proxy:
             print("Neard is connected to System bus")
@@ -138,9 +140,14 @@ class Neard:
             self.adaptregistered = {}
             self.interface_getDetails()
 
-    #Main init function
-    def __init__(self, adapter_update = None, adapters_remove = None,
-                  tags_update = None, records_update = None):
+    # Main init function
+    def __init__(
+        self,
+        adapter_update=None,
+        adapters_remove=None,
+        tags_update=None,
+        records_update=None,
+    ):
         self.test = False
         self.adapter_update = adapter_update
         self.adapters_remove = adapters_remove
@@ -153,9 +160,11 @@ class Neard:
 
         self.systemBus = dbus.SystemBus()
 
-        #Prepare the first handler
-        self.systemBus.watch_name_owner(neardutils.SERVICE_NAME,
-                                        self.neardNameOwnerChanged)
+        # Prepare the first handler
+        self.systemBus.watch_name_owner(
+            neardutils.SERVICE_NAME, self.neardNameOwnerChanged
+        )
+
 
 ##=================================================================
 class NeardUI(Neard):
@@ -174,8 +183,10 @@ class NeardUI(Neard):
             i = self.adapters_list.get_iter(path)
             objpath = self.adapters_list.get_value(i, 0)
             adapt_iface = neardutils.find_adapter(path)
-            adapter = dbus.Interface(bus.get_object(neardutils.SERVICE_NAME, adapt_iface.object_path),
-                                     "org.freedesktop.DBus.Properties")
+            adapter = dbus.Interface(
+                bus.get_object(neardutils.SERVICE_NAME, adapt_iface.object_path),
+                "org.freedesktop.DBus.Properties",
+            )
 
             try:
                 if self.adapters_actionToggle(i, 2):
@@ -209,18 +220,18 @@ class NeardUI(Neard):
             except:
                 print("Can't toggle polling on adapter %s" % objpath)
 
-    #------------------------------
-    #Set the field values
-    def adapters_setUIList(self, adapt_properties, i, col, name, path = None):
+    # ------------------------------
+    # Set the field values
+    def adapters_setUIList(self, adapt_properties, i, col, name, path=None):
         if name in adapt_properties:
             value = adapt_properties[name]
 
             if name == "Tags":
                 value = "{"
                 for tgts in adapt_properties[name]:
-                    #For each tag, add it to the tag lbox:
-                    #Trim path....
-                    short_tgt = tgts[len(path)+1:]
+                    # For each tag, add it to the tag lbox:
+                    # Trim path....
+                    short_tgt = tgts[len(path) + 1 :]
 
                     if value == "{":
                         value = "{" + short_tgt
@@ -244,8 +255,8 @@ class NeardUI(Neard):
     def adapter_RemoveUI(self):
         self.adapters_list.clear()
 
-    #Add, Update or delete a list entry
-    def adapter_UpdateUI(self, path = None, adapt_properties = None):
+    # Add, Update or delete a list entry
+    def adapter_UpdateUI(self, path=None, adapt_properties=None):
         i = self.adapters_list.get_iter_first()
         while i is not None:
             if self.adapters_list.get_value(i, 0) == path:
@@ -267,13 +278,12 @@ class NeardUI(Neard):
         else:
             print("Update adapter %s" % (path))
 
-
         self.adapters_setUIList(adapt_properties, i, 2, "Powered")
         self.adapters_setUIList(adapt_properties, i, 3, "Polling")
         self.adapters_setUIList(adapt_properties, i, 4, "Protocols")
         self.adapters_setUIList(adapt_properties, i, 5, "Tags", path)
 
-    #--------------------------------------------------
+    # --------------------------------------------------
     def tags_setUIList(self, tag_properties, i, col, name):
         if name in tag_properties:
             value = tag_properties[name]
@@ -281,7 +291,7 @@ class NeardUI(Neard):
             if name == "Type":
                 value = None
                 for tags in tag_properties[name]:
-                    #For each tag, add it to the tag lbox:
+                    # For each tag, add it to the tag lbox:
                     if value is None:
                         value = tags
                     else:
@@ -291,8 +301,8 @@ class NeardUI(Neard):
                 self.tags_list.set_value(i, col, value)
             print("  property %s, value %s" % (name, value))
 
-    #Add, Update or delete a list entry
-    def tag_UpdateUI(self, path = None, tag_properties = None):
+    # Add, Update or delete a list entry
+    def tag_UpdateUI(self, path=None, tag_properties=None):
         print("Tag Update %s" % path)
         i = self.tags_list.get_iter_first()
         while i is not None:
@@ -300,7 +310,7 @@ class NeardUI(Neard):
                 break
             i = self.tags_list.iter_next(i)
 
-        #Delete mode: Remove all
+        # Delete mode: Remove all
         if tag_properties is None:
             i = self.tags_list.get_iter_first()
             while i is not None:
@@ -322,7 +332,7 @@ class NeardUI(Neard):
         self.tags_setUIList(tag_properties, i, 2, "ReadOnly")
         self.tags_setUIList(tag_properties, i, 3, "Type")
 
-    #--------------------------------------------------
+    # --------------------------------------------------
     def records_setUIList(self, record_properties, i, col, name):
         if name in record_properties:
             value = record_properties[name]
@@ -330,16 +340,16 @@ class NeardUI(Neard):
             value = ""
             for rec_data in record_properties:
                 if rec_data != "Type":
-                     if value != "":
-                         value = value + "\n"
-                     value = value + rec_data + " :   " +record_properties[rec_data]
+                    if value != "":
+                        value = value + "\n"
+                    value = value + rec_data + " :   " + record_properties[rec_data]
 
         if value is not None:
             self.records_list.set_value(i, col, value)
         print("  property %s, value %s" % (name, value))
 
-    #Add, Update or delete a list entry
-    def record_UpdateUI(self, path = None, record_properties = None):
+    # Add, Update or delete a list entry
+    def record_UpdateUI(self, path=None, record_properties=None):
         print("Record Update %s" % path)
         i = self.records_list.get_iter_first()
         while i is not None:
@@ -347,7 +357,7 @@ class NeardUI(Neard):
                 break
             i = self.records_list.iter_next(i)
 
-         #Delete mode: Remove all records
+        # Delete mode: Remove all records
         if record_properties is None:
             i = self.records_list.get_iter_first()
             while i is not None:
@@ -370,25 +380,23 @@ class NeardUI(Neard):
         self.records_setUIList(record_properties, i, 2, "Type")
         self.records_setUIList(record_properties, i, 3, "Data")
 
-
     def tag_RemoveUI(self):
         printf("Tag Remove")
 
-    #Adapter selected on lbox
-    def on_adapter_sel_changed(self, selection = None):
+    # Adapter selected on lbox
+    def on_adapter_sel_changed(self, selection=None):
         model, iter = selection.get_selected()
         if iter:
-             value = self.adapters_list.get_value(iter, 0)
-             print("value %s" % value)
-             value = self.adapters_list.get_value(iter, 5)
-             print("tag: %s" % value)
+            value = self.adapters_list.get_value(iter, 0)
+            print("value %s" % value)
+            value = self.adapters_list.get_value(iter, 5)
+            print("tag: %s" % value)
 
-
-    #-----------------------------------------------------
+    # -----------------------------------------------------
     # Prepare TreeView  for Adapters
     def createAdaptersWidgets(self, adaptlist):
 
-        #treeview adapters
+        # treeview adapters
         tv_adapters = gtk.TreeView(adaptlist)
 
         column = gtk.TreeViewColumn("Path", gtk.CellRendererText(), text=0)
@@ -396,26 +404,24 @@ class NeardUI(Neard):
 
         toggle = gtk.CellRendererToggle()
         column = gtk.TreeViewColumn("Powered", toggle, active=2)
-        toggle.connect('toggled', self.adapter_poweredToggled, None)
+        toggle.connect("toggled", self.adapter_poweredToggled, None)
         tv_adapters.append_column(column)
 
         toggle = gtk.CellRendererToggle()
         column = gtk.TreeViewColumn("Polling", toggle, active=3)
-        toggle.connect('toggled', self.adapter_pollingToggled, None)
+        toggle.connect("toggled", self.adapter_pollingToggled, None)
         tv_adapters.append_column(column)
 
-        column = gtk.TreeViewColumn("Protocols",gtk.CellRendererText(), text=4)
+        column = gtk.TreeViewColumn("Protocols", gtk.CellRendererText(), text=4)
         tv_adapters.append_column(column)
 
-        tv_adapters.get_selection().connect("changed",
-                                            self.on_adapter_sel_changed)
+        tv_adapters.get_selection().connect("changed", self.on_adapter_sel_changed)
 
-        return tv_adapters;
+        return tv_adapters
 
     # Prepare TreeView  for Tags
     def createTagsWidgets(self, tags_list):
 
-
         tv_tags = gtk.TreeView(tags_list)
 
         column = gtk.TreeViewColumn("Path", gtk.CellRendererText(), text=0)
@@ -427,11 +433,12 @@ class NeardUI(Neard):
         column = gtk.TreeViewColumn("Type", gtk.CellRendererText(), text=3)
         tv_tags.append_column(column)
 
-        return tv_tags;#
+        return tv_tags
+        #
 
     # Prepare TreeView  for Records
     def createRecordsWidgets(self, records_list):
-        #treeview Records
+        # treeview Records
         tv_records = gtk.TreeView(records_list)
         tv_records.connect("row-activated", self.on_record_activated)
 
@@ -443,23 +450,23 @@ class NeardUI(Neard):
 
         column = gtk.TreeViewColumn("Data", gtk.CellRendererText(), text=3)
         tv_records.append_column(column)
-        return tv_records;
+        return tv_records
 
     # Prepare TreeView  for Records
     def createWriteWidgets(self, records_list):
-        #treeview Records
+        # treeview Records
         tv_records = gtk.TreeView(records_list)
-        #tv_records.connect("row-activated", self.on_record_activated)
+        # tv_records.connect("row-activated", self.on_record_activated)
 
-        #column = gtk.TreeViewColumn("Path", gtk.CellRendererText(), text=0)
-        #tv_records.append_column(column)
+        # column = gtk.TreeViewColumn("Path", gtk.CellRendererText(), text=0)
+        # tv_records.append_column(column)
 
-        #column = gtk.TreeViewColumn("Type", gtk.CellRendererText(), text=2)
-        #tv_records.append_column(column)
+        # column = gtk.TreeViewColumn("Type", gtk.CellRendererText(), text=2)
+        # tv_records.append_column(column)
 
-        #column = gtk.TreeViewColumn("Data", gtk.CellRendererText(), text=3)
-        #tv_records.append_column(column)
-        return tv_records;
+        # column = gtk.TreeViewColumn("Data", gtk.CellRendererText(), text=3)
+        # tv_records.append_column(column)
+        return tv_records
 
     def on_record_activated(self, widget, row, col):
         model = widget.get_model()
@@ -472,15 +479,17 @@ class NeardUI(Neard):
         if self.response_callback is not None:
             self.response_callback(response)
 
-    #------------------------------
-    #Prepare the dialog
-    def createDialog(self, title = None):
+    # ------------------------------
+    # Prepare the dialog
+    def createDialog(self, title=None):
         if self.title is not None:
             title = self.title
-        dialog = gtk.Dialog(title, None,
-                            gtk.DIALOG_MODAL |
-                            gtk.DIALOG_DESTROY_WITH_PARENT,
-                            (gtk.STOCK_OK, gtk.RESPONSE_ACCEPT))
+        dialog = gtk.Dialog(
+            title,
+            None,
+            gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT,
+            (gtk.STOCK_OK, gtk.RESPONSE_ACCEPT),
+        )
         dialog.set_property("resizable", True)
         dialog.set_default_size(800, 300)
 
@@ -504,7 +513,7 @@ class NeardUI(Neard):
         scrolledwindow.add(widget)
         notebook.append_page(scrolledwindow, gtk.Label("Records"))
 
-        dialog.connect('response', self.dlg_onResponse)
+        dialog.connect("response", self.dlg_onResponse)
         return dialog
 
     def show(self):
@@ -512,33 +521,45 @@ class NeardUI(Neard):
             self.neardDialog = self.createDialog()
         self.neardDialog.show_all()
 
-    def __init__(self, title = None, response_callback = None):
+    def __init__(self, title=None, response_callback=None):
         self.title = title
         self.response_callback = response_callback
         self.neardDialog = None
 
-        self.adapters_list = gtk.ListStore(gobject.TYPE_STRING,  # path =0
-                                      gobject.TYPE_STRING,  # Name = 1
-                                      gobject.TYPE_BOOLEAN, # powered = 2
-                                      gobject.TYPE_BOOLEAN, # polling = 3
-                                      gobject.TYPE_STRING,  # protocols = 4
-                                      gobject.TYPE_STRING)  # tags = 5
-
-        self.tags_list = gtk.ListStore(gobject.TYPE_STRING,  # path =0
-                                      gobject.TYPE_STRING,      # Name = 1
-                                      gobject.TYPE_BOOLEAN,     # Read Only 2
-                                      gobject.TYPE_STRING,      # Type = 3
-                                      gobject.TYPE_STRING)     # Record = 4
-
-        self.records_list = gtk.ListStore(gobject.TYPE_STRING,  # path =0
-                                      gobject.TYPE_STRING,      # Name = 1
-                                      gobject.TYPE_STRING,      # Type = 2
-                                      gobject.TYPE_STRING)        # content = 3
-
-        Neard.__init__(self, self.adapter_UpdateUI, self.adapter_RemoveUI
-                       , self.tag_UpdateUI, self.record_UpdateUI)
-
-class RecordUI():
+        self.adapters_list = gtk.ListStore(
+            gobject.TYPE_STRING,  # path =0
+            gobject.TYPE_STRING,  # Name = 1
+            gobject.TYPE_BOOLEAN,  # powered = 2
+            gobject.TYPE_BOOLEAN,  # polling = 3
+            gobject.TYPE_STRING,  # protocols = 4
+            gobject.TYPE_STRING,
+        )  # tags = 5
+
+        self.tags_list = gtk.ListStore(
+            gobject.TYPE_STRING,  # path =0
+            gobject.TYPE_STRING,  # Name = 1
+            gobject.TYPE_BOOLEAN,  # Read Only 2
+            gobject.TYPE_STRING,  # Type = 3
+            gobject.TYPE_STRING,
+        )  # Record = 4
+
+        self.records_list = gtk.ListStore(
+            gobject.TYPE_STRING,  # path =0
+            gobject.TYPE_STRING,  # Name = 1
+            gobject.TYPE_STRING,  # Type = 2
+            gobject.TYPE_STRING,
+        )  # content = 3
+
+        Neard.__init__(
+            self,
+            self.adapter_UpdateUI,
+            self.adapter_RemoveUI,
+            self.tag_UpdateUI,
+            self.record_UpdateUI,
+        )
+
+
+class RecordUI:
     def wr_onResponse(self, dialog, response):
         if response != gtk.RESPONSE_ACCEPT:
             return
@@ -546,30 +567,35 @@ class RecordUI():
         type_name = self.type_combo.get_active_text()
         bus = dbus.SystemBus()
         record_path = self.path
-        tag_path = record_path[:record_path.rfind("/")]
-        tag = dbus.Interface(bus.get_object(neardutils.SERVICE_NAME, tag_path), neardutils.TAG_INTERFACE)
+        tag_path = record_path[: record_path.rfind("/")]
+        tag = dbus.Interface(
+            bus.get_object(neardutils.SERVICE_NAME, tag_path), neardutils.TAG_INTERFACE
+        )
         if type_name in ["Text"]:
             content1 = content.split()
-            tag.Write({"Type" : type_name,
-                      "Encoding" : content1[0],
-                      "Language" : content1[1],
-                      "Representation" : ' '.join(content1[2:])})
+            tag.Write(
+                {
+                    "Type": type_name,
+                    "Encoding": content1[0],
+                    "Language": content1[1],
+                    "Representation": " ".join(content1[2:]),
+                }
+            )
         else:
-            tag.Write({"Type" : type_name,
-                       "URI" : content})
+            tag.Write({"Type": type_name, "URI": content})
         dialog.destroy()
 
-    def __init__(self, parent = None, path = None, type_name = None):
+    def __init__(self, parent=None, path=None, type_name=None):
         self.path = path
         type_combo = gtk.combo_box_new_text()
-        type_combo.append_text('Text')
-        type_combo.append_text('URI')
-        type_combo.append_text('SmartPoster')
-        if type_name == 'Text':
+        type_combo.append_text("Text")
+        type_combo.append_text("URI")
+        type_combo.append_text("SmartPoster")
+        if type_name == "Text":
             type_combo.set_active(0)
-        elif type_name == 'URI':
+        elif type_name == "URI":
             type_combo.set_active(1)
-        elif type_name == 'SmartPoster':
+        elif type_name == "SmartPoster":
             type_combo.set_active(2)
         fixed = gtk.Fixed()
         content_entry = gtk.Entry()
@@ -580,13 +606,16 @@ class RecordUI():
         fixed.put(type_label, 20, 15)
         fixed.put(content_label, 150, 15)
 
-        record_dialog = gtk.Dialog("Write Record", parent,
-                        gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT,
-                        (gtk.STOCK_CANCEL, gtk.RESPONSE_REJECT,gtk.STOCK_OK, gtk.RESPONSE_ACCEPT))
+        record_dialog = gtk.Dialog(
+            "Write Record",
+            parent,
+            gtk.DIALOG_MODAL | gtk.DIALOG_DESTROY_WITH_PARENT,
+            (gtk.STOCK_CANCEL, gtk.RESPONSE_REJECT, gtk.STOCK_OK, gtk.RESPONSE_ACCEPT),
+        )
         self.record_dialog = record_dialog
         record_dialog.set_default_size(280, 120)
         record_dialog.set_position(gtk.WIN_POS_CENTER)
-        record_dialog.connect('response', self.wr_onResponse)
+        record_dialog.connect("response", self.wr_onResponse)
         hbox = record_dialog.get_content_area()
         hbox.pack_start(fixed)
         self.type_combo = type_combo
@@ -597,6 +626,7 @@ class RecordUI():
         self.record_dialog.run()
         self.record_dialog.destroy()
 
+
 ##=================================================================
 if __name__ == "__main__":
 
diff --git a/test/neardutils.py b/test/neardutils.py
index 520870ab7944..da421daaae05 100644
--- a/test/neardutils.py
+++ b/test/neardutils.py
@@ -6,88 +6,102 @@ DEVICE_INTERFACE = SERVICE_NAME + ".Device"
 TAG_INTERFACE = SERVICE_NAME + ".Tag"
 RECORD_INTERFACE = SERVICE_NAME + ".Record"
 
+
 def get_managed_objects():
-        bus = dbus.SystemBus()
-        manager = dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
-                                "org.freedesktop.DBus.ObjectManager")
-        return manager.GetManagedObjects()
+    bus = dbus.SystemBus()
+    manager = dbus.Interface(
+        bus.get_object(SERVICE_NAME, "/"), "org.freedesktop.DBus.ObjectManager"
+    )
+    return manager.GetManagedObjects()
+
 
 def find_adapter(pattern=None):
-        return find_adapter_in_objects(get_managed_objects(), pattern)
+    return find_adapter_in_objects(get_managed_objects(), pattern)
+
 
 def find_adapter_in_objects(objects, pattern=None):
-        bus = dbus.SystemBus()
-        for path, ifaces in objects.items():
-                adapter = ifaces.get(ADAPTER_INTERFACE)
-                if adapter is None:
-                        continue
-                if not pattern or path.endswith(pattern):
-                        obj = bus.get_object(SERVICE_NAME, path)
-                        return dbus.Interface(obj, ADAPTER_INTERFACE)
-        raise Exception("NFC adapter not found")
+    bus = dbus.SystemBus()
+    for path, ifaces in objects.items():
+        adapter = ifaces.get(ADAPTER_INTERFACE)
+        if adapter is None:
+            continue
+        if not pattern or path.endswith(pattern):
+            obj = bus.get_object(SERVICE_NAME, path)
+            return dbus.Interface(obj, ADAPTER_INTERFACE)
+    raise Exception("NFC adapter not found")
+
 
 def find_device(pattern=None):
-        return find_device_in_objects(get_managed_objects(), pattern)
+    return find_device_in_objects(get_managed_objects(), pattern)
+
 
 def find_device_in_objects(objects, pattern=None):
-        bus = dbus.SystemBus()
-        for path, ifaces in objects.items():
-                device = ifaces.get(DEVICE_INTERFACE)
-                if device is None:
-                        continue
-                if not pattern or path.endswith(pattern):
-                        obj = bus.get_object(SERVICE_NAME, path)
-                        return dbus.Interface(obj, DEVICE_INTERFACE)
-        raise Exception("NFC device not found")
+    bus = dbus.SystemBus()
+    for path, ifaces in objects.items():
+        device = ifaces.get(DEVICE_INTERFACE)
+        if device is None:
+            continue
+        if not pattern or path.endswith(pattern):
+            obj = bus.get_object(SERVICE_NAME, path)
+            return dbus.Interface(obj, DEVICE_INTERFACE)
+    raise Exception("NFC device not found")
+
 
 def find_tag(pattern=None):
-        return find_tag_in_objects(get_managed_objects(), pattern)
+    return find_tag_in_objects(get_managed_objects(), pattern)
+
 
 def find_tag_in_objects(objects, pattern=None):
-        bus = dbus.SystemBus()
-        for path, ifaces in objects.items():
-                tag = ifaces.get(TAG_INTERFACE)
-                if tag is None:
-                        continue
-                if not pattern or path.endswith(pattern):
-                        obj = bus.get_object(SERVICE_NAME, path)
-                        return dbus.Interface(obj, TAG_INTERFACE)
-        raise Exception("NFC tag not found")
+    bus = dbus.SystemBus()
+    for path, ifaces in objects.items():
+        tag = ifaces.get(TAG_INTERFACE)
+        if tag is None:
+            continue
+        if not pattern or path.endswith(pattern):
+            obj = bus.get_object(SERVICE_NAME, path)
+            return dbus.Interface(obj, TAG_INTERFACE)
+    raise Exception("NFC tag not found")
+
 
 def find_record(pattern=None):
-        return find_record_in_objects(get_managed_objects(), pattern)
+    return find_record_in_objects(get_managed_objects(), pattern)
+
 
 def find_record_in_objects(objects, pattern=None):
-        bus = dbus.SystemBus()
-        for path, ifaces in objects.items():
-                record = ifaces.get(RECORD_INTERFACE)
-                if record is None:
-                        continue
-                if not pattern or path.endswith(pattern):
-                        obj = bus.get_object(SERVICE_NAME, path)
-                        return dbus.Interface(obj, RECORD_INTERFACE)
-        raise Exception("NFC record not found")
+    bus = dbus.SystemBus()
+    for path, ifaces in objects.items():
+        record = ifaces.get(RECORD_INTERFACE)
+        if record is None:
+            continue
+        if not pattern or path.endswith(pattern):
+            obj = bus.get_object(SERVICE_NAME, path)
+            return dbus.Interface(obj, RECORD_INTERFACE)
+    raise Exception("NFC record not found")
+
 
 def dump_record(record_path):
-        bus = dbus.SystemBus()
-        record_prop = dbus.Interface(bus.get_object(SERVICE_NAME, record_path),
-                                        "org.freedesktop.DBus.Properties")
+    bus = dbus.SystemBus()
+    record_prop = dbus.Interface(
+        bus.get_object(SERVICE_NAME, record_path), "org.freedesktop.DBus.Properties"
+    )
+
+    properties = record_prop.GetAll(RECORD_INTERFACE)
 
-        properties = record_prop.GetAll(RECORD_INTERFACE)
+    for key in properties.keys():
+        val = str(properties[key])
+        print("      %s = %s" % (key, val))
 
-        for key in properties.keys():
-                val = str(properties[key])
-                print("      %s = %s" % (key, val))
 
 def dump_all_records(path):
-        bus = dbus.SystemBus()
-        om = dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
-                                        "org.freedesktop.DBus.ObjectManager")
-        objects = om.GetManagedObjects()
-        for path, interfaces in objects.items():
-                if RECORD_INTERFACE not in interfaces:
-                        continue
-
-                if path.startswith(path):
-                        print("  [ %s ]" % (path))
-                        dump_record(path)
+    bus = dbus.SystemBus()
+    om = dbus.Interface(
+        bus.get_object(SERVICE_NAME, "/"), "org.freedesktop.DBus.ObjectManager"
+    )
+    objects = om.GetManagedObjects()
+    for path, interfaces in objects.items():
+        if RECORD_INTERFACE not in interfaces:
+            continue
+
+        if path.startswith(path):
+            print("  [ %s ]" % (path))
+            dump_record(path)
diff --git a/test/phdc-simple-manager b/test/phdc-simple-manager
index 97dc8fd6090d..7bcf68b20cd2 100755
--- a/test/phdc-simple-manager
+++ b/test/phdc-simple-manager
@@ -19,72 +19,76 @@ SOL_NFC = 280
 NFC_LLCP_MIUX = 1
 
 # Sample test code - compliant with nfcpy phdc test agent
-thermometer_assoc_req = \
-    "E200 0032 8000 0000" \
-    "0001 002A 5079 0026" \
-    "8000 0000 A000 8000" \
-    "0000 0000 0000 0080" \
-    "0000 0008 3132 3334" \
-    "3536 3738 0320 0001" \
+thermometer_assoc_req = (
+    "E200 0032 8000 0000"
+    "0001 002A 5079 0026"
+    "8000 0000 A000 8000"
+    "0000 0000 0000 0080"
+    "0000 0008 3132 3334"
+    "3536 3738 0320 0001"
     "0100 0000 0000"
-
-thermometer_assoc_res = \
-    "E300 002C 0003 5079" \
-    "0026 8000 0000 8000" \
-    "8000 0000 0000 0000" \
-    "8000 0000 0008 3837" \
-    "3635 3433 3231 0000" \
-    "0000 0000 0000 0000" \
-
+)
+
+thermometer_assoc_res = (
+    "E300 002C 0003 5079"
+    "0026 8000 0000 8000"
+    "8000 0000 0000 0000"
+    "8000 0000 0008 3837"
+    "3635 3433 3231 0000"
+    "0000 0000 0000 0000"
+)
 assoc_release_req = "E40000020000"
 assoc_release_res = "E50000020000"
 
-#========================================
+# ========================================
 # Display helper
-def hexdump( chars, sep, width ):
-        while chars:
-                line = chars[:width]
-                chars = chars[width:]
-                line = line.ljust( width, '\000' )
-                print("%s%s%s" % ( sep.join( "%02x" % ord(c) for c in line ),
-                         sep, quotechars( line )))
+def hexdump(chars, sep, width):
+    while chars:
+        line = chars[:width]
+        chars = chars[width:]
+        line = line.ljust(width, "\000")
+        print(
+            "%s%s%s" % (sep.join("%02x" % ord(c) for c in line), sep, quotechars(line))
+        )
 
 
-def quotechars( chars ):
-        return ''.join( ['.', c][c.isalnum()] for c in chars )
+def quotechars(chars):
+    return "".join([".", c][c.isalnum()] for c in chars)
 
-#========================================
+
+# ========================================
 class PhdcPeerManager:
     def __init__(self, agent_fd):
-        #Grab the agent ....
-        print('Init PhdcPeerManager thread')
+        # Grab the agent ....
+        print("Init PhdcPeerManager thread")
         self.r_fd = agent_fd.take()
-        print('Agent fd:', str(self.r_fd))
+        print("Agent fd:", str(self.r_fd))
 
-    def run( self):
-        print('Run PhdcPeerManager thread: ', str(self.r_fd))
+    def run(self):
+        print("Run PhdcPeerManager thread: ", str(self.r_fd))
         self.sock = socket.fromfd(self.r_fd, AF_NFC, socket.SOCK_STREAM)
         try:
             while True:
                 miu = self.sock.getsockopt(SOL_NFC, NFC_LLCP_MIUX)
-                print('MIU=', miu)
+                print("MIU=", miu)
 
                 while True:
                     data = self.sock.recv(16)
                     if data == None:
-                       print('no data')
-                       break
+                        print("no data")
+                        break
 
-                   #analyze frame
-                    print('analyze')
+                    # analyze frame
+                    print("analyze")
                     size = struct.unpack(">H", data[0:2])[0]
                     apdu = data[2:]
 
-                    #should i read more data ?
+                    # should i read more data ?
                     while len(apdu) < size:
                         data = self.sock.recv(10)
-                        if data == None: break
-                        hexdump(data, ':', 16)
+                        if data == None:
+                            break
+                        hexdump(data, ":", 16)
                         apdu += data
                     print("[ieee] <<< {0}".format(str(apdu).encode("hex")))
                     if apdu.startswith("\xE2\x00"):
@@ -97,97 +101,103 @@ class PhdcPeerManager:
                     print("[ieee] >>> {0}".format(str(apdu).encode("hex")))
                     data = struct.pack(">H", len(apdu)) + apdu
                     for i in range(0, len(data), miu):
-                        self.sock.send(str(data[i:i+miu]))
+                        self.sock.send(str(data[i : i + miu]))
 
                 print("remote peer {0} closed connection".format(agent_fd))
                 print("leaving ieee manager")
                 self.sock.close()
 
         except IOError as e:
-                if e.errno == errno.EPIPE:
-                        print('Remote disconnect')
-                else:
-                        print("I/O error({0}): {1}".format(e.errno, e.strerror))
+            if e.errno == errno.EPIPE:
+                print("Remote disconnect")
+            else:
+                print("I/O error({0}): {1}".format(e.errno, e.strerror))
         finally:
-                print('Finally exit')
-                stop()
+            print("Finally exit")
+            stop()
 
         def stop(self):
-                print('Stop PhdcPeerManager:', str(self.r_fd))
-                self._Thread__stop()
+            print("Stop PhdcPeerManager:", str(self.r_fd))
+            self._Thread__stop()
 
-#===================================================
-''' Phdc Manager Class
-'''
-class SimplePhdcManager(dbus.service.Object):
 
-        @dbus.service.method('org.neard.PHDC.Manager',
-                                        in_signature='',
-                                        out_signature='')
-        def Release(self):
-                print('Release')
-                mainloop.quit()
-
-
-        ''' Called on incoming agents
-        '''
-        @dbus.service.method('org.neard.PHDC.Manager',
-                                        in_signature='h',
-                                        out_signature='')
-        def NewConnection(self, agent_fd):
-                print('Launch Phdc Manager thread for fd:', str(agent_fd))
-                self.server = PhdcPeerManager(agent_fd)
-                print('Run Server')
-                self.server.run()
-                print('Leave Server')
-                return
-
-        ''' Called when the agent ends (from phdc_close)
-        '''
-        @dbus.service.method('org.neard.PHDC.Manager',
-                                        in_signature='hi', out_signature='')
-        def Disconnection(self,agent_fd, i_err):
-                print('Stop Phdc Manager thread')
-                self.server.stop()
-                return
-
-''' Main loop
+# ===================================================
+""" Phdc Manager Class
+"""
+
+
+class SimplePhdcManager(dbus.service.Object):
+    @dbus.service.method("org.neard.PHDC.Manager", in_signature="", out_signature="")
+    def Release(self):
+        print("Release")
+        mainloop.quit()
+
+    """ Called on incoming agents
+        """
+
+    @dbus.service.method("org.neard.PHDC.Manager", in_signature="h", out_signature="")
+    def NewConnection(self, agent_fd):
+        print("Launch Phdc Manager thread for fd:", str(agent_fd))
+        self.server = PhdcPeerManager(agent_fd)
+        print("Run Server")
+        self.server.run()
+        print("Leave Server")
+        return
+
+    """ Called when the agent ends (from phdc_close)
+        """
+
+    @dbus.service.method("org.neard.PHDC.Manager", in_signature="hi", out_signature="")
+    def Disconnection(self, agent_fd, i_err):
+        print("Stop Phdc Manager thread")
+        self.server.stop()
+        return
+
+
+""" Main loop
 This sample installs two PHDC Managers:
         * Simple: simulates a thermometer data exchange
         * Validation: Validation Manager for NFC Forum PHDC)
-'''
+"""
 if "__main__" == __name__:
-        dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
 
-        print('PHDC Simple Manager Test')
-        bus = dbus.SystemBus()
-        obj = bus.get_object("org.neard", "/org/neard");
-        neard_manager = dbus.Interface(obj, "org.neard.PHDC")
+    print("PHDC Simple Manager Test")
+    bus = dbus.SystemBus()
+    obj = bus.get_object("org.neard", "/org/neard")
+    neard_manager = dbus.Interface(obj, "org.neard.PHDC")
 
-        simple_path = '/Simple'
-        valid_path = '/Validation'
+    simple_path = "/Simple"
+    valid_path = "/Validation"
 
-        print('Creating & registering PHDC Simple Manager')
-        simpleobject = SimplePhdcManager(bus, simple_path)
+    print("Creating & registering PHDC Simple Manager")
+    simpleobject = SimplePhdcManager(bus, simple_path)
 
-        d = dbus.Dictionary({'Role': 'Manager', 'Path': simple_path,
-                        'ServiceName': 'urn:nfc:sn:phdc' }, signature='sv')
-        neard_manager.RegisterAgent(d)
+    d = dbus.Dictionary(
+        {"Role": "Manager", "Path": simple_path, "ServiceName": "urn:nfc:sn:phdc"},
+        signature="sv",
+    )
+    neard_manager.RegisterAgent(d)
 
-        print('Creating & Registering Validation Manager')
+    print("Creating & Registering Validation Manager")
 
-        validationobj= SimplePhdcManager(bus, valid_path)
-        d = dbus.Dictionary({'Role': 'Manager', 'Path': valid_path,
-                'ServiceName': 'urn:nfc:xsn:nfc-forum.org:phdc-validation' },
-                 signature='sv')
-        neard_manager.RegisterAgent(d)
+    validationobj = SimplePhdcManager(bus, valid_path)
+    d = dbus.Dictionary(
+        {
+            "Role": "Manager",
+            "Path": valid_path,
+            "ServiceName": "urn:nfc:xsn:nfc-forum.org:phdc-validation",
+        },
+        signature="sv",
+    )
+    neard_manager.RegisterAgent(d)
 
-        mainloop = gobject.MainLoop()
+    mainloop = gobject.MainLoop()
 
 try:
-        mainloop.run()
+    mainloop.run()
 
-except(KeyboardInterrupt):
-        #Call for unregister...
-        neard_manager.UnregisterAgent(simple_path, 'Manager')
-        neard_manager.UnregisterAgent(valid_path, 'Manager')
+except (KeyboardInterrupt):
+    # Call for unregister...
+    neard_manager.UnregisterAgent(simple_path, "Manager")
+    neard_manager.UnregisterAgent(valid_path, "Manager")
diff --git a/test/test-adapter b/test/test-adapter
index 6d22f59bda0f..682a8bd73c94 100755
--- a/test/test-adapter
+++ b/test/test-adapter
@@ -6,102 +6,106 @@ import neardutils
 
 bus = dbus.SystemBus()
 
-def extract_list(list):
-        val = "["
-        for i in list:
-                val += " " + str(i)
-        val += " ]"
-        return val
 
-def usage():
-        print("Usage: %s <command>" % (sys.argv[0]) )
-        print("")
-        print("  list")
-        print("  powered nfcX [on/off]")
-        print("  poll nfcX [on/off] [Initiator/Target/Dual]")
-        sys.exit(1)
-
-if (len(sys.argv) < 2):
-        usage()
+def extract_list(list):
+    val = "["
+    for i in list:
+        val += " " + str(i)
+    val += " ]"
+    return val
 
-if (sys.argv[1] == "list"):
-        if (len(sys.argv) < 3):
-                objects = neardutils.get_managed_objects()
-                for path, interfaces in objects.items():
-                        if "org.neard.Adapter" not in interfaces:
-                                continue
 
-                        print(" [ %s ]" % (path))
+def usage():
+    print("Usage: %s <command>" % (sys.argv[0]))
+    print("")
+    print("  list")
+    print("  powered nfcX [on/off]")
+    print("  poll nfcX [on/off] [Initiator/Target/Dual]")
+    sys.exit(1)
 
-                        props = interfaces["org.neard.Adapter"]
 
-                        for (key, value) in props.items():
-                                if (key == "Protocols"):
-                                        val = extract_list(value)
-                                        print("    %s = %s" % (key, val))
+if len(sys.argv) < 2:
+    usage()
 
-                                elif key in ["Powered", "Polling"]:
-                                        if value == dbus.Boolean(1):
-                                                val = "true"
-                                        else:
-                                                val = "false"
-                                        print("    %s = %s" % (key, val))
+if sys.argv[1] == "list":
+    if len(sys.argv) < 3:
+        objects = neardutils.get_managed_objects()
+        for path, interfaces in objects.items():
+            if "org.neard.Adapter" not in interfaces:
+                continue
 
-                                else:
-                                        print("    %s = %s" % (key, value))
+            print(" [ %s ]" % (path))
 
-                sys.exit(0)
+            props = interfaces["org.neard.Adapter"]
 
-if (sys.argv[1] == "powered"):
-        if (len(sys.argv) < 4):
-                usage()
-        else:
-                path = "/org/neard/" + sys.argv[2]
+            for (key, value) in props.items():
+                if key == "Protocols":
+                    val = extract_list(value)
+                    print("    %s = %s" % (key, val))
 
-                adapter_path = neardutils.find_adapter(path).object_path
-                adapter = dbus.Interface(bus.get_object("org.neard", adapter_path),
-                                        "org.freedesktop.DBus.Properties")
+                elif key in ["Powered", "Polling"]:
+                    if value == dbus.Boolean(1):
+                        val = "true"
+                    else:
+                        val = "false"
+                    print("    %s = %s" % (key, val))
 
-                if (sys.argv[3] == "on"):
-                        value = dbus.Boolean(1)
-                elif (sys.argv[3] == "off"):
-                        value = dbus.Boolean(0)
                 else:
-                        value = dbus.Boolean(sys.argv[3])
-                try:
-                        adapter.Set("org.neard.Adapter", "Powered", value)
-                except dbus.DBusException as error:
-                        print("%s: %s" % (error._dbus_error_name, error.message))
+                    print("    %s = %s" % (key, value))
+
         sys.exit(0)
 
-if (sys.argv[1] == "poll"):
-        if (len(sys.argv) < 4):
-                usage()
+if sys.argv[1] == "powered":
+    if len(sys.argv) < 4:
+        usage()
+    else:
+        path = "/org/neard/" + sys.argv[2]
+
+        adapter_path = neardutils.find_adapter(path).object_path
+        adapter = dbus.Interface(
+            bus.get_object("org.neard", adapter_path), "org.freedesktop.DBus.Properties"
+        )
+
+        if sys.argv[3] == "on":
+            value = dbus.Boolean(1)
+        elif sys.argv[3] == "off":
+            value = dbus.Boolean(0)
         else:
-                path = "/org/neard/" + sys.argv[2]
+            value = dbus.Boolean(sys.argv[3])
+        try:
+            adapter.Set("org.neard.Adapter", "Powered", value)
+        except dbus.DBusException as error:
+            print("%s: %s" % (error._dbus_error_name, error.message))
+    sys.exit(0)
+
+if sys.argv[1] == "poll":
+    if len(sys.argv) < 4:
+        usage()
+    else:
+        path = "/org/neard/" + sys.argv[2]
 
-                adapter = neardutils.find_adapter(path)
+        adapter = neardutils.find_adapter(path)
 
-                if (sys.argv[3] == "on"):
-                        if (len(sys.argv) == 4):
-                                mode = "Initiator"
-                        else:
-                                mode = sys.argv[4]
+        if sys.argv[3] == "on":
+            if len(sys.argv) == 4:
+                mode = "Initiator"
+            else:
+                mode = sys.argv[4]
 
-                        try:
-                                adapter.StartPollLoop(mode)
-                        except dbus.DBusException as error:
-                                print("%s: %s" % (error._dbus_error_name, error.message))
+            try:
+                adapter.StartPollLoop(mode)
+            except dbus.DBusException as error:
+                print("%s: %s" % (error._dbus_error_name, error.message))
 
-                elif (sys.argv[3] == "off"):
-                        try:
-                                adapter.StopPollLoop()
-                        except dbus.DBusException as error:
-                                print("%s: %s" % (error._dbus_error_name, error.message))
+        elif sys.argv[3] == "off":
+            try:
+                adapter.StopPollLoop()
+            except dbus.DBusException as error:
+                print("%s: %s" % (error._dbus_error_name, error.message))
 
-                else:
-                        usage()
+        else:
+            usage()
 
-        sys.exit(0)
+    sys.exit(0)
 
 usage()
diff --git a/test/test-device b/test/test-device
index 3086e1aad915..63f97559223f 100755
--- a/test/test-device
+++ b/test/test-device
@@ -6,111 +6,139 @@ import neardutils
 
 bus = dbus.SystemBus()
 
+
 def extract_list(list):
-        val = "["
-        for i in list:
-                val += " " + str(i)
-        val += " ]"
-        return val
+    val = "["
+    for i in list:
+        val += " " + str(i)
+    val += " ]"
+    return val
 
-def usage():
-        print("Usage: %s <command>" % (sys.argv[0]) )
-        print("")
-        print("  list")
-        print("  dump <device>")
-        print("  push <device> <type> <...>")
-        print("    If type is Text, parameters are <encoding> <language> <representation>")
-        print("    If type is URI, parameters are <uri>")
-        print("    If type is SmartPoster, parameters are <uri>")
-        print("    If type is Handover, parameters are <carrier>")
-        print("    If type is StaticHandover, parameters are <carrier>")
-        print("    If type is MIME, parameters are <mime_type> (only wifi_wsc and raw)")
-        print("       raw is for sending raw payload, parameters are <mime_type> <payload>")
-        print("e.g. < %s push /org/neard/nfc0/device0 Text UTF-8 en-US hello,Type2! >" % (sys.argv[0]))
-        print("e.g. < %s push /org/neard/nfc0/device0 URI http://www.nfc-forum.com >" % (sys.argv[0]))
-        print("e.g. < %s push /org/neard/nfc0/device0 SmartPoster http://www.nfc-forum.com >" % (sys.argv[0]))
-        print("e.g. < %s push /org/neard/nfc0/device0 Handover bluetooth,wifi >" % (sys.argv[0]))
-        print("e.g. < %s push /org/neard/nfc0/device0 StaticHandover bluetooth,wifi >" % (sys.argv[0]))
-        print("e.g. < %s push /org/neard/nfc0/device0 MIME wifi_wsc>" % (sys.argv[0]))
-        print("e.g. < %s push /org/neard/nfc0/device0 MIME raw application/xml '<your><xml tags></your>' >" % (sys.argv[0]))
-
-        sys.exit(1)
-
-if (len(sys.argv) < 2):
-        usage()
 
-if (sys.argv[1] == "list"):
-        if (len(sys.argv) < 3):
-                objects = neardutils.get_managed_objects()
-                for path, interfaces in objects.items():
-                        if "org.neard.Device" not in interfaces:
-                                continue
+def usage():
+    print("Usage: %s <command>" % (sys.argv[0]))
+    print("")
+    print("  list")
+    print("  dump <device>")
+    print("  push <device> <type> <...>")
+    print("    If type is Text, parameters are <encoding> <language> <representation>")
+    print("    If type is URI, parameters are <uri>")
+    print("    If type is SmartPoster, parameters are <uri>")
+    print("    If type is Handover, parameters are <carrier>")
+    print("    If type is StaticHandover, parameters are <carrier>")
+    print("    If type is MIME, parameters are <mime_type> (only wifi_wsc and raw)")
+    print("       raw is for sending raw payload, parameters are <mime_type> <payload>")
+    print(
+        "e.g. < %s push /org/neard/nfc0/device0 Text UTF-8 en-US hello,Type2! >"
+        % (sys.argv[0])
+    )
+    print(
+        "e.g. < %s push /org/neard/nfc0/device0 URI http://www.nfc-forum.com >"
+        % (sys.argv[0])
+    )
+    print(
+        "e.g. < %s push /org/neard/nfc0/device0 SmartPoster http://www.nfc-forum.com >"
+        % (sys.argv[0])
+    )
+    print(
+        "e.g. < %s push /org/neard/nfc0/device0 Handover bluetooth,wifi >"
+        % (sys.argv[0])
+    )
+    print(
+        "e.g. < %s push /org/neard/nfc0/device0 StaticHandover bluetooth,wifi >"
+        % (sys.argv[0])
+    )
+    print("e.g. < %s push /org/neard/nfc0/device0 MIME wifi_wsc>" % (sys.argv[0]))
+    print(
+        "e.g. < %s push /org/neard/nfc0/device0 MIME raw application/xml '<your><xml tags></your>' >"
+        % (sys.argv[0])
+    )
+
+    sys.exit(1)
+
+
+if len(sys.argv) < 2:
+    usage()
+
+if sys.argv[1] == "list":
+    if len(sys.argv) < 3:
+        objects = neardutils.get_managed_objects()
+        for path, interfaces in objects.items():
+            if "org.neard.Device" not in interfaces:
+                continue
+
+            print(" [ %s ]" % (path))
+
+            props = interfaces["org.neard.Device"]
+
+            for (key, value) in props.items():
+                print("    %s = %s" % (key, value))
 
-                        print(" [ %s ]" % (path))
+        sys.exit(0)
 
-                        props = interfaces["org.neard.Device"]
+if sys.argv[1] == "dump":
+    if len(sys.argv) < 3:
+        objects = neardutils.get_managed_objects()
+        for path, interfaces in objects.items():
+            if "org.neard.Device" not in interfaces:
+                continue
 
-                        for (key, value) in props.items():
-                                print("    %s = %s" % (key, value))
+            print("[ %s ]" % (path))
+            neardutils.dump_all_records(path)
 
-                sys.exit(0)
+        sys.exit(0)
+    else:
+        neardutils.dump_all_records(sys.argv[2])
 
-if (sys.argv[1] == "dump"):
-        if (len(sys.argv) < 3):
-                objects = neardutils.get_managed_objects()
-                for path, interfaces in objects.items():
-                        if "org.neard.Device" not in interfaces:
-                                continue
+        sys.exit(0)
 
-                        print("[ %s ]" % (path))
-                        neardutils.dump_all_records(path)
+if sys.argv[1] == "push":
+    if len(sys.argv) < 5:
+        usage()
 
-                sys.exit(0)
+    device = neardutils.find_device(sys.argv[2])
+
+    if len(sys.argv) == 7:
+        if sys.argv[3] in ["Text"]:
+            device.Push(
+                (
+                    {
+                        "Type": "Text",
+                        "Encoding": sys.argv[4],
+                        "Language": sys.argv[5],
+                        "Representation": sys.argv[6],
+                    }
+                )
+            )
+        elif sys.argv[3] in ["MIME"]:
+            if sys.argv[4] in ["raw"]:
+                device.Push(
+                    (
+                        {
+                            "Type": "MIME",
+                            "MIME": sys.argv[5],
+                            "Payload": dbus.ByteArray(sys.argv[6]),
+                        }
+                    )
+                )
         else:
-                neardutils.dump_all_records(sys.argv[2])
-
-                sys.exit(0)
-
-if (sys.argv[1] == "push"):
-        if (len(sys.argv) < 5):
-                usage()
-        
-        device = neardutils.find_device(sys.argv[2])
-
-        if len(sys.argv) == 7:
-                if sys.argv[3] in ["Text"]:
-                        device.Push(({ "Type" : "Text",
-                                "Encoding" : sys.argv[4],
-                                "Language" : sys.argv[5],
-                                "Representation" : sys.argv[6] }))
-                elif sys.argv[3] in ["MIME"]:
-                        if sys.argv[4] in ["raw"]:
-                                device.Push(({ "Type" : "MIME",
-                                       "MIME" : sys.argv[5],
-                                       "Payload" : dbus.ByteArray(sys.argv[6]) }))
-                else:
-                        usage()
-
-        elif len(sys.argv) == 5:
-                if sys.argv[3] in ["URI"]:
-                        device.Push(({ "Type" : "URI",
-                                "URI" : sys.argv[4] }))
-                elif sys.argv[3] in ["SmartPoster"]:
-                        device.Push(({ "Type" : "SmartPoster",
-                                "URI" : sys.argv[4] }))
-                elif sys.argv[3] in ["Handover"]:
-                        device.Push(({ "Type" : "Handover",
-                                "Carrier" : sys.argv[4] }))
-                elif sys.argv[3] in ["StaticHandover"]:
-                        device.Push(({ "Type" : "StaticHandover",
-                                "Carrier" : sys.argv[4] }))
-                elif sys.argv[3] in ["MIME"]:
-                        if sys.argv[4] in ["wifi_wsc"]:
-                                device.Push(({ "Type" : "MIME",
-                                        "MIME" : "application/vnd.wfa.wsc"}))
-                else:
-                        usage()
+            usage()
+
+    elif len(sys.argv) == 5:
+        if sys.argv[3] in ["URI"]:
+            device.Push(({"Type": "URI", "URI": sys.argv[4]}))
+        elif sys.argv[3] in ["SmartPoster"]:
+            device.Push(({"Type": "SmartPoster", "URI": sys.argv[4]}))
+        elif sys.argv[3] in ["Handover"]:
+            device.Push(({"Type": "Handover", "Carrier": sys.argv[4]}))
+        elif sys.argv[3] in ["StaticHandover"]:
+            device.Push(({"Type": "StaticHandover", "Carrier": sys.argv[4]}))
+        elif sys.argv[3] in ["MIME"]:
+            if sys.argv[4] in ["wifi_wsc"]:
+                device.Push(({"Type": "MIME", "MIME": "application/vnd.wfa.wsc"}))
         else:
-                usage()
+            usage()
+    else:
+        usage()
 
-        sys.exit(0)
+    sys.exit(0)
diff --git a/test/test-tag b/test/test-tag
index 4183b9c3ded8..782e1e6977c0 100755
--- a/test/test-tag
+++ b/test/test-tag
@@ -6,9 +6,10 @@ import neardutils
 
 bus = dbus.SystemBus()
 
+
 def usage():
-        print("Usage: %s <command>" % sys.argv[0])
-        text = """
+    print("Usage: %s <command>" % sys.argv[0])
+    text = """
 list
 dump <tag>
 deactivate <tag>
@@ -36,147 +37,154 @@ For example: # %s write /org/neard/nfc0/tag0 \\
         MIME wifi_wsc YourAPname
         MIME 'application/octet-stream' 1234
 """
-        print(text % sys.argv[0])
+    print(text % sys.argv[0])
 
-        sys.exit(1)
+    sys.exit(1)
 
-if (len(sys.argv) < 2):
-        usage()
 
-if (sys.argv[1] == "list"):
-        if (len(sys.argv) < 3):
-                objects = neardutils.get_managed_objects()
-                for path, interfaces in objects.items():
-                        if "org.neard.Tag" not in interfaces:
-                                continue
+if len(sys.argv) < 2:
+    usage()
 
-                        print(" [ %s ]" % (path))
+if sys.argv[1] == "list":
+    if len(sys.argv) < 3:
+        objects = neardutils.get_managed_objects()
+        for path, interfaces in objects.items():
+            if "org.neard.Tag" not in interfaces:
+                continue
 
-                        props = interfaces["org.neard.Tag"]
+            print(" [ %s ]" % (path))
 
-                        for (key, value) in props.items():
-                                if key in ["ReadOnly"]:
-                                        if value == dbus.Boolean(1):
-                                                val = "true"
-                                        else:
-                                                val = "false"
-                                        print("    %s = %s" % (key, val))
+            props = interfaces["org.neard.Tag"]
 
-                                else:
-                                        print("    %s = %s" % (key, value))
+            for (key, value) in props.items():
+                if key in ["ReadOnly"]:
+                    if value == dbus.Boolean(1):
+                        val = "true"
+                    else:
+                        val = "false"
+                    print("    %s = %s" % (key, val))
 
-                sys.exit(0)
+                else:
+                    print("    %s = %s" % (key, value))
 
-if (sys.argv[1] == "dump"):
-        if (len(sys.argv) < 3):
-                objects = neardutils.get_managed_objects()
-                for path, interfaces in objects.items():
-                        if "org.neard.Tag" not in interfaces:
-                                continue
+        sys.exit(0)
 
-                        print("[ %s ]" % (path))
-                        neardutils.dump_all_records(path)
+if sys.argv[1] == "dump":
+    if len(sys.argv) < 3:
+        objects = neardutils.get_managed_objects()
+        for path, interfaces in objects.items():
+            if "org.neard.Tag" not in interfaces:
+                continue
 
-                sys.exit(0)
-        else:
-                neardutils.dump_all_records(sys.argv[2])
+            print("[ %s ]" % (path))
+            neardutils.dump_all_records(path)
+
+        sys.exit(0)
+    else:
+        neardutils.dump_all_records(sys.argv[2])
+
+        sys.exit(0)
 
-                sys.exit(0)
 
 def write_mime(args):
 
-        data = { "Type" : "MIME" }
+    data = {"Type": "MIME"}
+
+    if len(args) < 2:
+        usage()
 
-        if len(args) < 2:
-                usage()
+    if args[0] == "wifi_wsc":
 
-        if args[0] == "wifi_wsc":
+        data["MIME"] = "application/vnd.wfa.wsc"
+        data["SSID"] = args[1]
 
-                data["MIME"] = "application/vnd.wfa.wsc"
-                data["SSID"] = args[1]
+        if len(args) > 2:
 
-                if len(args) > 2:
+            data["Passphrase"] = args[2]
+    else:
+        data["MIME"] = args[0]
+        data["MIMEPayload"] = dbus.ByteArray(args[1])
 
-                        data["Passphrase"] = args[2]
-        else:
-                data["MIME"] = args[0]
-                data["MIMEPayload"] = dbus.ByteArray(args[1])
+    tag.Write(data)
 
-        tag.Write(data)
 
 def write_uri(args):
 
-        data = { }
-        records = [ ]
+    data = {}
+    records = []
 
-        if len(args) > 1:
+    if len(args) > 1:
 
-                for i in args:
+        for i in args:
 
-                        record = { }
+            record = {}
 
-                        record["Type"] = dbus.String("URI", variant_level = 1)
-                        record["URI"] = dbus.String(i, variant_level = 1)
+            record["Type"] = dbus.String("URI", variant_level=1)
+            record["URI"] = dbus.String(i, variant_level=1)
 
-                        records.append(record)
+            records.append(record)
 
-                data["Records"] = records
+        data["Records"] = records
 
-        else:
+    else:
 
-                data["Type"] = "URI"
-                data["URI"] = args[0]
+        data["Type"] = "URI"
+        data["URI"] = args[0]
 
-        print(data)
+    print(data)
 
-        tag.Write(data)
+    tag.Write(data)
 
-if (sys.argv[1] == "write"):
-        if (len(sys.argv) < 5):
-                usage()
 
-        tag = neardutils.find_tag(sys.argv[2])
+if sys.argv[1] == "write":
+    if len(sys.argv) < 5:
+        usage()
 
-        if sys.argv[3] in ["Text"]:
-                tag.Write(({ "Type" : "Text",
-                        "Encoding" : sys.argv[4],
-                        "Language" : sys.argv[5],
-                        "Representation" : sys.argv[6] }))
+    tag = neardutils.find_tag(sys.argv[2])
 
-        elif sys.argv[3] == "URI":
-                write_uri(sys.argv[4:])
+    if sys.argv[3] in ["Text"]:
+        tag.Write(
+            (
+                {
+                    "Type": "Text",
+                    "Encoding": sys.argv[4],
+                    "Language": sys.argv[5],
+                    "Representation": sys.argv[6],
+                }
+            )
+        )
 
-        elif sys.argv[3] in ["SmartPoster"]:
-                tag.Write(({ "Type" : "SmartPoster",
-                        "URI" : sys.argv[4] }))
+    elif sys.argv[3] == "URI":
+        write_uri(sys.argv[4:])
 
-        elif sys.argv[3] in ["SMS"]:
-                URI = "sms:" + sys.argv[4] + "?body=" + sys.argv[5]
-                tag.Write(({ "Type" : "URI",
-                        "URI" : URI }))
+    elif sys.argv[3] in ["SmartPoster"]:
+        tag.Write(({"Type": "SmartPoster", "URI": sys.argv[4]}))
 
-        elif sys.argv[3] in ["E-Mail"]:
-                URI = "mailto:" + sys.argv[4]
-                tag.Write(({ "Type" : "URI",
-                        "URI" : URI }))
+    elif sys.argv[3] in ["SMS"]:
+        URI = "sms:" + sys.argv[4] + "?body=" + sys.argv[5]
+        tag.Write(({"Type": "URI", "URI": URI}))
 
-        elif sys.argv[3] in ["MIME"]:
-                write_mime(sys.argv[4:])
+    elif sys.argv[3] in ["E-Mail"]:
+        URI = "mailto:" + sys.argv[4]
+        tag.Write(({"Type": "URI", "URI": URI}))
 
-        else:
-                usage()
+    elif sys.argv[3] in ["MIME"]:
+        write_mime(sys.argv[4:])
 
-        sys.exit(0)
+    else:
+        usage()
 
-if (sys.argv[1] == "deactivate"):
-        print(sys.argv[2])
-        if (len(sys.argv) != 2):
-                tag = neardutils.find_tag(sys.argv[2])
-                tag.Deactivate()
-        else:
-                usage()
+    sys.exit(0)
 
-        sys.exit(0)
+if sys.argv[1] == "deactivate":
+    print(sys.argv[2])
+    if len(sys.argv) != 2:
+        tag = neardutils.find_tag(sys.argv[2])
+        tag.Deactivate()
+    else:
+        usage()
+
+    sys.exit(0)
 
 else:
-        usage()
+    usage()
-- 
2.33.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
