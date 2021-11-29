Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0478460E4D
	for <lists+linux-nfc@lfdr.de>; Mon, 29 Nov 2021 06:06:39 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 74207100EA100;
	Sun, 28 Nov 2021 21:06:34 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CDBFB100F2240
	for <linux-nfc@lists.01.org>; Sun, 28 Nov 2021 21:06:31 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id E77F13200A39;
	Mon, 29 Nov 2021 00:06:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 29 Nov 2021 00:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=AxEHZiKqfxhne
	4ESHaUquyTyHwd28rHSgMaLBQv1WI8=; b=TnqTTbn6rfIYGWS2ZO5efSiCxUOxF
	9d46VCGz5QQMQMogW6eoDuBhI1iwwiwNG5lj+oG4TjQx0dz7i6EtNt1jjtKhCWJO
	d7nd1SWeYjt+QAdwZMq0CWg4UK9vbiAzAIkuVONM8h3a+TqLxIRpX/slw+FIS9zy
	f8C5gw7cU1cxKT5UUM3QzQEx+ztHHmsIv+TYEnsCNtfzTHzVR192U0nIfaCJPx4c
	sKFv7a2X+vlZVHr1Aps0LCR3vDrQu8uPECrjVtUq/VApIidn0DJgu771hL+MWIzF
	iYa4OcfeBZV1XofUjwe/mvBlVRiNH0acUY2fXpWUT7tB4pByejAmBrdlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=AxEHZiKqfxhne4ESHaUquyTyHwd28rHSgMaLBQv1WI8=; b=JnikosGw
	SmVmlFd3OBcCMRTimf5/zqzSnefCiuilsngXJCd6uVkfgN2o5rGflzi6i5+4J/2k
	bBgTlmvbpCWJcTMcmV+LoP2k612omVsgEKWhtEC00SL75ZonFZbRG1fgg4hYGWek
	7vn1R4Xw5wBJLeUW/Y6tu7sjWO/N8vFpnXpPV1Z7CDbGEHZo5h9e6caDidxmBN62
	EpA28kkFg8fkIYSx/c1iYPEqg1QoyOSLvj3qP0UItVARMT5dVj6DtXgYQVv6n9aS
	sPrX74ZE2tvUquY0sFR8OgARkBiHqy+H96L8/7vmef6wCWy7vSUdeswFr3P62klc
	uw2ycy7eOlLbUw==
X-ME-Sender: <xms:1l-kYUh2JbVITCDW_ky_rBfJh8CngZMtZLS11V12IBzkWG5yFmOlGA>
    <xme:1l-kYdAojouV1goUdg6pJdoXSDUaRzZ_BWuS60h2osh06uv3TiL8SezCHjCvlgU0Y
    Un_NYO6anxSdAjgvA>
X-ME-Received: <xmr:1l-kYcGYUhvG7bmaKkpx5gsW0b4A5EtQbLEZ77gWIzZf9FY3F-QtjWBfUKqaskt1u8Fz3YBGX4USuEPKKD50cHRrJEwBS16mrSxN-WY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforghrkhcuifhrvggvrhcuoehmghhrvggvrh
    esrghnihhmrghltghrvggvkhdrtghomheqnecuggftrfgrthhtvghrnhepteeutedvveeh
    geeiheduheeifeektdetgedtgeekjeeutefhudfhffdvtdejjeffnecuffhomhgrihhnpe
    hphihthhhonhdrohhrghdpshgvrhhvvghrrdhruhhnpdhnfhgtqdhfohhruhhmrdhorhhg
    pdhnfhgtqdhfohhruhhmrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepmhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:1l-kYVTcN0wCXCh3kcLsqY2h_3SwAfmv-9vvxciXjAjTUbUtvQm5RA>
    <xmx:1l-kYRwMcNVMkfOuOyGwW0N5cX5hrKq73Nboj_TR9qPQ2gX7vjpqrQ>
    <xmx:1l-kYT7sTH55yBHOCE38Mc7ehkdDCo5z-ly_CXp7plDjJPW7cxaQdA>
    <xmx:1l-kYSqehqQTKrX537yeqmy9YSc_3nqjFtY5lxiQXlemXqKitm7slw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 00:06:29 -0500 (EST)
Received: from blue.animalcreek.com (localhost [127.0.0.1])
	by blue.animalcreek.com (Postfix) with ESMTP id 0D70A13604A6;
	Sun, 28 Nov 2021 22:06:29 -0700 (MST)
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Date: Sun, 28 Nov 2021 22:06:01 -0700
Message-Id: <20211129050606.873494-2-mgreer@animalcreek.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211129050606.873494-1-mgreer@animalcreek.com>
References: <20211129050606.873494-1-mgreer@animalcreek.com>
MIME-Version: 1.0
Message-ID-Hash: YXETMUW4PZ3G46DTUU6FOME4IO7DQ57V
X-Message-ID-Hash: YXETMUW4PZ3G46DTUU6FOME4IO7DQ57V
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 1/6] test: Use spaces for Python test scripts
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YXETMUW4PZ3G46DTUU6FOME4IO7DQ57V/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Python PEP 8 style guide prefers spaces over tabs so replace all
tabs in the Python test scripts with spaces. See:

	https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces

Signed-off-by: Mark Greer <mgreer@animalcreek.com>
---
 test/bt-handover         | 192 ++++++++++++++++-----------------
 test/handover-agent      | 208 ++++++++++++++++++------------------
 test/monitor-near        |  50 ++++-----
 test/ndef-agent          | 112 ++++++++++----------
 test/neardutils.py       | 128 +++++++++++-----------
 test/phdc-simple-manager | 154 +++++++++++++--------------
 test/test-adapter        | 160 ++++++++++++++--------------
 test/test-device         | 180 +++++++++++++++----------------
 test/test-tag            | 224 +++++++++++++++++++--------------------
 9 files changed, 704 insertions(+), 704 deletions(-)

diff --git a/test/bt-handover b/test/bt-handover
index 42d66bff8d66..fc77404da972 100755
--- a/test/bt-handover
+++ b/test/bt-handover
@@ -14,118 +14,118 @@ from dbus.lowlevel import MethodCallMessage, HANDLER_RESULT_NOT_YET_HANDLED
 mainloop = gobject.MainLoop()
 
 def device_added(path, interfaces):
-	for iface, props in interfaces.iteritems():
-		if "org.neard.Device" in interfaces:
-			print("Pairing with %s" % (path))
-			device = dbus.Interface(bus.get_object("org.neard", path),
-							"org.neard.Device")
-			device.Push(({ "Type" : "Handover", "Carrier" : "bluetooth"}))
-			break
+        for iface, props in interfaces.iteritems():
+                if "org.neard.Device" in interfaces:
+                        print("Pairing with %s" % (path))
+                        device = dbus.Interface(bus.get_object("org.neard", path),
+                                                        "org.neard.Device")
+                        device.Push(({ "Type" : "Handover", "Carrier" : "bluetooth"}))
+                        break
 
 def device_removed(path, interfaces):
-	for iface in interfaces:
-		if "org.neard.Device" in interfaces:
-			print("Lost device %s" % (path))
-			mainloop.quit()
-			break
+        for iface in interfaces:
+                if "org.neard.Device" in interfaces:
+                        print("Lost device %s" % (path))
+                        mainloop.quit()
+                        break
 
 def remove_paired_devices(bt_adapter):
-	manager = dbus.Interface(bus.get_object("org.bluez", "/"),
-					"org.freedesktop.DBus.ObjectManager")
-	objects = manager.GetManagedObjects()
+        manager = dbus.Interface(bus.get_object("org.bluez", "/"),
+                                        "org.freedesktop.DBus.ObjectManager")
+        objects = manager.GetManagedObjects()
 
-	all_adapters = (path for path, interfaces in objects.iteritems() if
-				"org.bluez.Adapter1" in interfaces.keys()
-				and path.endswith(bt_adapter))
+        all_adapters = (path for path, interfaces in objects.iteritems() if
+                                "org.bluez.Adapter1" in interfaces.keys()
+                                and path.endswith(bt_adapter))
 
-	bluez_adapter = None
-	for adapter in sorted(all_adapters):
-		bluez_adapter = dbus.Interface(bus.get_object("org.bluez",
-							adapter),
-							"org.bluez.Adapter1")
-		break
+        bluez_adapter = None
+        for adapter in sorted(all_adapters):
+                bluez_adapter = dbus.Interface(bus.get_object("org.bluez",
+                                                        adapter),
+                                                        "org.bluez.Adapter1")
+                break
 
-	if(bluez_adapter is None):
-		print("Bluetooth adapter %s could not be found" % bluez_adapter)
-		exit()
+        if(bluez_adapter is None):
+                print("Bluetooth adapter %s could not be found" % bluez_adapter)
+                exit()
 
-	adapter_path = bluez_adapter.object_path
-	print("Using %s" % adapter_path)
+        adapter_path = bluez_adapter.object_path
+        print("Using %s" % adapter_path)
 
-	adapter_props = dbus.Interface(bus.get_object("org.bluez", adapter_path),
-					"org.freedesktop.DBus.Properties")
+        adapter_props = dbus.Interface(bus.get_object("org.bluez", adapter_path),
+                                        "org.freedesktop.DBus.Properties")
 
-	powered = adapter_props.Get("org.bluez.Adapter1", "Powered")
-	if (powered == dbus.Boolean(0)):
-		print("Bluetooth adapter %s is not powered" % adapter_path )
-		exit()
+        powered = adapter_props.Get("org.bluez.Adapter1", "Powered")
+        if (powered == dbus.Boolean(0)):
+                print("Bluetooth adapter %s is not powered" % adapter_path )
+                exit()
 
-	all_devices = (path for path, interfaces in objects.iteritems() if
-				("org.bluez.Device1" in interfaces.keys()
-				and path.startswith(bluez_adapter.object_path)))
+        all_devices = (path for path, interfaces in objects.iteritems() if
+                                ("org.bluez.Device1" in interfaces.keys()
+                                and path.startswith(bluez_adapter.object_path)))
 
-	for device in all_devices:
-		print("Removing %s" % (device))
-		bluez_adapter.RemoveDevice(device)
+        for device in all_devices:
+                print("Removing %s" % (device))
+                bluez_adapter.RemoveDevice(device)
 
 def remove_paired_devices_bluez4():
-	bluez_manager = dbus.Interface(bus.get_object("org.bluez", "/"),
-					"org.bluez.Manager")
+        bluez_manager = dbus.Interface(bus.get_object("org.bluez", "/"),
+                                        "org.bluez.Manager")
 
-	bluez_adapter_path = bluez_manager.DefaultAdapter()
-	bluez_adapter = dbus.Interface(bus.get_object("org.bluez",
-						bluez_adapter_path),
-						"org.bluez.Adapter")
+        bluez_adapter_path = bluez_manager.DefaultAdapter()
+        bluez_adapter = dbus.Interface(bus.get_object("org.bluez",
+                                                bluez_adapter_path),
+                                                "org.bluez.Adapter")
 
-	print("Using %s" % bluez_adapter.object_path)
+        print("Using %s" % bluez_adapter.object_path)
 
-	for bluez_path in bluez_adapter.ListDevices():
-		print("Removing %s" % (bluez_path))
-		bluez_adapter.RemoveDevice(bluez_path)
+        for bluez_path in bluez_adapter.ListDevices():
+                print("Removing %s" % (bluez_path))
+                bluez_adapter.RemoveDevice(bluez_path)
 
 if __name__ == '__main__':
-	parser = OptionParser()
-	parser.add_option("", "--bluez4", action="store_true",
-				dest="use_bluez4",
-				help="Use BlueZ 4 to remove paired devices.")
-	parser.add_option("-a", "--adapter", metavar="BT_ADAPTER",
-				dest="bt_adapter", default="",
-				help="The bluetooth adapter that is used by "
-					"the bluetooth stack. This options is "
-					"ignored when using BlueZ 4, instead "
-					"the default adapter is used.")
-	(options, args) = parser.parse_args()
-
-	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
-
-	bus = dbus.SystemBus()
-
-	adapter_path = neardutils.find_adapter().object_path
-	print("Adapter path %s" % (adapter_path))
-	adapter = dbus.Interface(bus.get_object("org.neard", adapter_path),
-							"org.neard.Adapter")
-
-	adapter_props = dbus.Interface(bus.get_object("org.neard", adapter_path),
-					"org.freedesktop.DBus.Properties")
-	powered = adapter_props.Get("org.neard.Adapter", "Powered")
-	if (powered == dbus.Boolean(0)):
-		adapter_props.Set("org.neard.Adapter", "Powered", dbus.Boolean(1))
-
-	if (options.use_bluez4):
-		remove_paired_devices_bluez4()
-	else:
-		remove_paired_devices(options.bt_adapter)
-
-	polling = adapter_props.Get("org.neard.Adapter", "Polling")
-	if (polling == dbus.Boolean(0)):
-		adapter.StartPollLoop("Initiator")
-
-	bus.add_signal_receiver(device_added, bus_name="org.neard",
-			dbus_interface="org.freedesktop.DBus.ObjectManager",
-			signal_name="InterfacesAdded")
-
-	bus.add_signal_receiver(device_removed, bus_name="org.neard",
-			dbus_interface="org.freedesktop.DBus.ObjectManager",
-			signal_name="InterfacesRemoved")
-
-	mainloop.run()
+        parser = OptionParser()
+        parser.add_option("", "--bluez4", action="store_true",
+                                dest="use_bluez4",
+                                help="Use BlueZ 4 to remove paired devices.")
+        parser.add_option("-a", "--adapter", metavar="BT_ADAPTER",
+                                dest="bt_adapter", default="",
+                                help="The bluetooth adapter that is used by "
+                                        "the bluetooth stack. This options is "
+                                        "ignored when using BlueZ 4, instead "
+                                        "the default adapter is used.")
+        (options, args) = parser.parse_args()
+
+        dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+
+        bus = dbus.SystemBus()
+
+        adapter_path = neardutils.find_adapter().object_path
+        print("Adapter path %s" % (adapter_path))
+        adapter = dbus.Interface(bus.get_object("org.neard", adapter_path),
+                                                        "org.neard.Adapter")
+
+        adapter_props = dbus.Interface(bus.get_object("org.neard", adapter_path),
+                                        "org.freedesktop.DBus.Properties")
+        powered = adapter_props.Get("org.neard.Adapter", "Powered")
+        if (powered == dbus.Boolean(0)):
+                adapter_props.Set("org.neard.Adapter", "Powered", dbus.Boolean(1))
+
+        if (options.use_bluez4):
+                remove_paired_devices_bluez4()
+        else:
+                remove_paired_devices(options.bt_adapter)
+
+        polling = adapter_props.Get("org.neard.Adapter", "Polling")
+        if (polling == dbus.Boolean(0)):
+                adapter.StartPollLoop("Initiator")
+
+        bus.add_signal_receiver(device_added, bus_name="org.neard",
+                        dbus_interface="org.freedesktop.DBus.ObjectManager",
+                        signal_name="InterfacesAdded")
+
+        bus.add_signal_receiver(device_removed, bus_name="org.neard",
+                        dbus_interface="org.freedesktop.DBus.ObjectManager",
+                        signal_name="InterfacesRemoved")
+
+        mainloop.run()
diff --git a/test/handover-agent b/test/handover-agent
index 7f2ac23246b0..dba00b6b9229 100755
--- a/test/handover-agent
+++ b/test/handover-agent
@@ -8,133 +8,133 @@ import dbus.mainloop.glib
 from optparse import OptionParser
 
 eir_test_data = [0x16,0x00\
-		,0x01,0x02,0x03,0x04,0x05,0x06\
-		,0x08,0x09,0x41,0x72,0x72,0x61,0x6b,0x69,0x73\
-		,0x04,0x0d,0x6e,0x01,0x00]
+                ,0x01,0x02,0x03,0x04,0x05,0x06\
+                ,0x08,0x09,0x41,0x72,0x72,0x61,0x6b,0x69,0x73\
+                ,0x04,0x0d,0x6e,0x01,0x00]
 
 wsc_test_data = [0x10,0x4A,0x00,0x01,0x10\
-		,0x10,0x45,0x00,0x08\
-		,0x74,0x65,0x73,0x74,0x73,0x73,0x69,0x64\
-		,0x10,0x27,0x00,0x06\
-		,0x62,0x6C,0x61,0x62,0x6C,0x61]
+                ,0x10,0x45,0x00,0x08\
+                ,0x74,0x65,0x73,0x74,0x73,0x73,0x69,0x64\
+                ,0x10,0x27,0x00,0x06\
+                ,0x62,0x6C,0x61,0x62,0x6C,0x61]
 
 power_state = None
 
 def print_fields(fields):
-	if 'EIR' in fields:
-		s = ' '.join('{:#02x}'.format(i) for i in fields['EIR'])
-		print '  EIR:  %s' % s
+        if 'EIR' in fields:
+                s = ' '.join('{:#02x}'.format(i) for i in fields['EIR'])
+                print '  EIR:  %s' % s
 
-	if 'nokia.com:bt' in fields:
-		s = ' '.join('{:#02x}'.format(i) for i in fields['nokia.com:bt'])
-		print '  nokia.com:bt:  %s' % s
+        if 'nokia.com:bt' in fields:
+                s = ' '.join('{:#02x}'.format(i) for i in fields['nokia.com:bt'])
+                print '  nokia.com:bt:  %s' % s
 
-	if 'State' in fields:
-		print '  State: %s' % fields['State']
+        if 'State' in fields:
+                print '  State: %s' % fields['State']
 
-	if 'WSC' in fields:
-		s = ' '.join('{:#02x}'.format(i) for i in fields['WSC'])
-		print '  WSC:  %s' % s
+        if 'WSC' in fields:
+                s = ' '.join('{:#02x}'.format(i) for i in fields['WSC'])
+                print '  WSC:  %s' % s
 
 class BTHOAgent(dbus.service.Object):
 
-	@dbus.service.method('org.neard.HandoverAgent',
-					in_signature='',
-					out_signature='')
-	def Release(self):
-		print 'Release'
-		mainloop.quit()
-
-	@dbus.service.method('org.neard.HandoverAgent',
-					in_signature='a{sv}',
-					out_signature='')
-	def PushOOB(self, fields):
-		print 'PushOOB'
-		print_fields(fields)
-
-	@dbus.service.method('org.neard.HandoverAgent',
-					in_signature='a{sv}',
-					out_signature='a{sv}')
-
-	def RequestOOB(self, fields):
-		print 'RequestOOB'
-		print_fields(fields)
-
-		print '  Replying with'
-		s = ' '.join('{:#02x}'.format(i) for i in eir_test_data)
-		print '    EIR: %s' % s
-
-		if power_state != 'unknown':
-			print '    State: %s' % power_state
-			return {'EIR' : eir_test_data, 'State' : power_state}
-		else:
-			return {'EIR' : eir_test_data}
+        @dbus.service.method('org.neard.HandoverAgent',
+                                        in_signature='',
+                                        out_signature='')
+        def Release(self):
+                print 'Release'
+                mainloop.quit()
+
+        @dbus.service.method('org.neard.HandoverAgent',
+                                        in_signature='a{sv}',
+                                        out_signature='')
+        def PushOOB(self, fields):
+                print 'PushOOB'
+                print_fields(fields)
+
+        @dbus.service.method('org.neard.HandoverAgent',
+                                        in_signature='a{sv}',
+                                        out_signature='a{sv}')
+
+        def RequestOOB(self, fields):
+                print 'RequestOOB'
+                print_fields(fields)
+
+                print '  Replying with'
+                s = ' '.join('{:#02x}'.format(i) for i in eir_test_data)
+                print '    EIR: %s' % s
+
+                if power_state != 'unknown':
+                        print '    State: %s' % power_state
+                        return {'EIR' : eir_test_data, 'State' : power_state}
+                else:
+                        return {'EIR' : eir_test_data}
 
 class WiFiHOAgent(dbus.service.Object):
 
-	@dbus.service.method('org.neard.HandoverAgent',
-					in_signature='',
-					out_signature='')
-	def Release(self):
-		print 'Release'
-		mainloop.quit()
-
-	@dbus.service.method('org.neard.HandoverAgent',
-					in_signature='a{sv}',
-					out_signature='')
-	def PushOOB(self, fields):
-		print 'PushOOB'
-		print_fields(fields)
-
-	@dbus.service.method('org.neard.HandoverAgent',
-					in_signature='a{sv}',
-					out_signature='a{sv}')
-
-	def RequestOOB(self, fields):
-		print 'RequestOOB'
-		print_fields(fields)
-
-		print '  Replying with'
-		s = ' '.join('{:#02x}'.format(i) for i in wsc_test_data)
-		print '    WSC: %s' % s
-
-		if power_state != 'unknown':
-			print '    State: %s' % power_state
-			return {'WSC' : wsc_test_data, 'State' : power_state}
-		else:
-			return {'WSC' : wsc_test_data}
+        @dbus.service.method('org.neard.HandoverAgent',
+                                        in_signature='',
+                                        out_signature='')
+        def Release(self):
+                print 'Release'
+                mainloop.quit()
+
+        @dbus.service.method('org.neard.HandoverAgent',
+                                        in_signature='a{sv}',
+                                        out_signature='')
+        def PushOOB(self, fields):
+                print 'PushOOB'
+                print_fields(fields)
+
+        @dbus.service.method('org.neard.HandoverAgent',
+                                        in_signature='a{sv}',
+                                        out_signature='a{sv}')
+
+        def RequestOOB(self, fields):
+                print 'RequestOOB'
+                print_fields(fields)
+
+                print '  Replying with'
+                s = ' '.join('{:#02x}'.format(i) for i in wsc_test_data)
+                print '    WSC: %s' % s
+
+                if power_state != 'unknown':
+                        print '    State: %s' % power_state
+                        return {'WSC' : wsc_test_data, 'State' : power_state}
+                else:
+                        return {'WSC' : wsc_test_data}
 
 if __name__ == '__main__':
-	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+        dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
 
-	bus = dbus.SystemBus()
+        bus = dbus.SystemBus()
 
-	parser = OptionParser()
-	parser.add_option("-s", "--power-state", action="store", type="string",
-				dest="power_state", default="active",
-				help="active inactive activating unknown")
-	(options, args) = parser.parse_args()
+        parser = OptionParser()
+        parser.add_option("-s", "--power-state", action="store", type="string",
+                                dest="power_state", default="active",
+                                help="active inactive activating unknown")
+        (options, args) = parser.parse_args()
 
-	power_state = options.power_state
+        power_state = options.power_state
 
-	obj = bus.get_object("org.neard", "/org/neard");
-	manager = dbus.Interface(obj, "org.neard.AgentManager")
+        obj = bus.get_object("org.neard", "/org/neard");
+        manager = dbus.Interface(obj, "org.neard.AgentManager")
 
-	btpath = '/test/handover/bt/agent'
-	btcarrier = 'bluetooth'
-	btobject = BTHOAgent(bus, btpath)
+        btpath = '/test/handover/bt/agent'
+        btcarrier = 'bluetooth'
+        btobject = BTHOAgent(bus, btpath)
 
-	wifipath = '/test/handover/wifi/agent'
-	wificarrier = 'wifi'
-	wifiobject = WiFiHOAgent(bus, wifipath)
+        wifipath = '/test/handover/wifi/agent'
+        wificarrier = 'wifi'
+        wifiobject = WiFiHOAgent(bus, wifipath)
 
-	manager.RegisterHandoverAgent(btpath, btcarrier)
-	manager.RegisterHandoverAgent(wifipath, wificarrier)
+        manager.RegisterHandoverAgent(btpath, btcarrier)
+        manager.RegisterHandoverAgent(wifipath, wificarrier)
 
-	mainloop = gobject.MainLoop()
+        mainloop = gobject.MainLoop()
 
-	try:
-		mainloop.run()
-	except (KeyboardInterrupt):
-		manager.UnregisterHandoverAgent(btpath, btcarrier)
-		manager.UnregisterHandoverAgent(wifipath, wificarrier)
+        try:
+                mainloop.run()
+        except (KeyboardInterrupt):
+                manager.UnregisterHandoverAgent(btpath, btcarrier)
+                manager.UnregisterHandoverAgent(wifipath, wificarrier)
diff --git a/test/monitor-near b/test/monitor-near
index f3ad021d60a3..49aa6db23f3f 100755
--- a/test/monitor-near
+++ b/test/monitor-near
@@ -8,39 +8,39 @@ import dbus
 import dbus.mainloop.glib
 
 def property_changed(interface, changed, invalidated, path):
-	iface = interface[interface.rfind(".") + 1:]
-	for name, value in changed.iteritems():
-		val = str(value)
-		print("{%s.PropertyChanged} [%s] %s = %s" % (iface, path, name,
-									val))
+        iface = interface[interface.rfind(".") + 1:]
+        for name, value in changed.iteritems():
+                val = str(value)
+                print("{%s.PropertyChanged} [%s] %s = %s" % (iface, path, name,
+                                                                        val))
 
 def interfaces_added(path, interfaces):
-	for iface, props in interfaces.iteritems():
-		print("{Added %s} [%s]" % (iface, path))
-		for name, value in props.iteritems():
-			print("      %s = %s" % (name, value))
+        for iface, props in interfaces.iteritems():
+                print("{Added %s} [%s]" % (iface, path))
+                for name, value in props.iteritems():
+                        print("      %s = %s" % (name, value))
 
 def interfaces_removed(path, interfaces):
-	for iface in interfaces:
-		print("{Removed %s} [%s]" % (iface, path))
+        for iface in interfaces:
+                print("{Removed %s} [%s]" % (iface, path))
 
 if __name__ == '__main__':
-	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+        dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
 
-	bus = dbus.SystemBus()
+        bus = dbus.SystemBus()
 
-	bus.add_signal_receiver(property_changed, bus_name="org.neard",
-			dbus_interface="org.freedesktop.DBus.Properties",
-			signal_name="PropertiesChanged",
-			path_keyword="path")
+        bus.add_signal_receiver(property_changed, bus_name="org.neard",
+                        dbus_interface="org.freedesktop.DBus.Properties",
+                        signal_name="PropertiesChanged",
+                        path_keyword="path")
 
-	bus.add_signal_receiver(interfaces_added, bus_name="org.neard",
-			dbus_interface="org.freedesktop.DBus.ObjectManager",
-			signal_name="InterfacesAdded")
+        bus.add_signal_receiver(interfaces_added, bus_name="org.neard",
+                        dbus_interface="org.freedesktop.DBus.ObjectManager",
+                        signal_name="InterfacesAdded")
 
-	bus.add_signal_receiver(interfaces_removed, bus_name="org.neard",
-			dbus_interface="org.freedesktop.DBus.ObjectManager",
-			signal_name="InterfacesRemoved")
+        bus.add_signal_receiver(interfaces_removed, bus_name="org.neard",
+                        dbus_interface="org.freedesktop.DBus.ObjectManager",
+                        signal_name="InterfacesRemoved")
 
-	mainloop = gobject.MainLoop()
-	mainloop.run()
\ No newline at end of file
+        mainloop = gobject.MainLoop()
+        mainloop.run()
diff --git a/test/ndef-agent b/test/ndef-agent
index 1cfeb03e2330..bb25ab17edf2 100755
--- a/test/ndef-agent
+++ b/test/ndef-agent
@@ -9,70 +9,70 @@ import sys
 
 class NDEFAgent(dbus.service.Object):
 
-	@dbus.service.method("org.neard.NDEFAgent",
-					in_signature='', out_signature='')
-	def Release(self):
-		print "Release"
-		mainloop.quit()
-
-	@dbus.service.method("org.neard.NDEFAgent",
-					in_signature='a{sv}',
-					out_signature='')
-	def GetNDEF(self, fields):
-		print "GetNDEF"
-
-		if fields.has_key("Record"):
-			print "Record path %s" % (fields["Record"])
-
-		if fields.has_key("Payload"):
-			val = "["
-			for i in fields["Payload"]:
-				val += " 0x%x" % i
-			val += " ]"
-			print "Record payload %s" % val
-
-		if fields.has_key("NDEF"):
-			val = "["
-			for i in fields["NDEF"]:
-				val += " 0x%x" % i
-			val += " ]"
-			print "Complete NDEF %s" % val
-
-		return
-
-	@dbus.service.method("org.neard.NDEFAgent",
-					in_signature='', out_signature='')
-	def Cancel(self):
-		print "Cancel"
+        @dbus.service.method("org.neard.NDEFAgent",
+                                        in_signature='', out_signature='')
+        def Release(self):
+                print "Release"
+                mainloop.quit()
+
+        @dbus.service.method("org.neard.NDEFAgent",
+                                        in_signature='a{sv}',
+                                        out_signature='')
+        def GetNDEF(self, fields):
+                print "GetNDEF"
+
+                if fields.has_key("Record"):
+                        print "Record path %s" % (fields["Record"])
+
+                if fields.has_key("Payload"):
+                        val = "["
+                        for i in fields["Payload"]:
+                                val += " 0x%x" % i
+                        val += " ]"
+                        print "Record payload %s" % val
+
+                if fields.has_key("NDEF"):
+                        val = "["
+                        for i in fields["NDEF"]:
+                                val += " 0x%x" % i
+                        val += " ]"
+                        print "Complete NDEF %s" % val
+
+                return
+
+        @dbus.service.method("org.neard.NDEFAgent",
+                                        in_signature='', out_signature='')
+        def Cancel(self):
+                print "Cancel"
 
 def print_usage():
-	print "Usage:"
-	print "%s Type=<record type>" % (sys.argv[0])
-	print "Help: %s help" % (sys.argv[0])
-	sys.exit(1)
+        print "Usage:"
+        print "%s Type=<record type>" % (sys.argv[0])
+        print "Help: %s help" % (sys.argv[0])
+        sys.exit(1)
 
 if __name__ == '__main__':
-	if len(sys.argv) != 2:
-		print_usage()
+        if len(sys.argv) != 2:
+                print_usage()
 
-	if len(sys.argv) == 2 and sys.argv[1] == "help":
-		print_usage()
+        if len(sys.argv) == 2 and sys.argv[1] == "help":
+                print_usage()
 
-	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+        dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
 
-	bus = dbus.SystemBus()
-	obj = bus.get_object("org.neard", "/org/neard");
-	manager = dbus.Interface(obj, "org.neard.AgentManager")
+        bus = dbus.SystemBus()
+        obj = bus.get_object("org.neard", "/org/neard");
+        manager = dbus.Interface(obj, "org.neard.AgentManager")
 
-	path = "/test/ndef/agent"
-	object = NDEFAgent(bus, path)
-	rec_type = sys.argv[1].replace("Type=", "", 1)
+        path = "/test/ndef/agent"
+        object = NDEFAgent(bus, path)
+        rec_type = sys.argv[1].replace("Type=", "", 1)
 
-	manager.RegisterNDEFAgent(path, rec_type)
+        manager.RegisterNDEFAgent(path, rec_type)
 
-	mainloop = gobject.MainLoop()
+        mainloop = gobject.MainLoop()
 
-	try:
-		mainloop.run()
-	except (KeyboardInterrupt):
-		manager.UnregisterNDEFAgent(path, rec_type)
+        try:
+                mainloop.run()
+        except (KeyboardInterrupt):
+                manager.UnregisterNDEFAgent(path, rec_type)
diff --git a/test/neardutils.py b/test/neardutils.py
index d93ae637bb27..6e423c075fe2 100644
--- a/test/neardutils.py
+++ b/test/neardutils.py
@@ -7,90 +7,90 @@ TAG_INTERFACE = SERVICE_NAME + ".Tag"
 RECORD_INTERFACE = SERVICE_NAME + ".Record"
 
 def get_managed_objects():
-	bus = dbus.SystemBus()
-	manager = dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
-				"org.freedesktop.DBus.ObjectManager")
-	return manager.GetManagedObjects()
+        bus = dbus.SystemBus()
+        manager = dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
+                                "org.freedesktop.DBus.ObjectManager")
+        return manager.GetManagedObjects()
 
 def find_adapter(pattern=None):
-	return find_adapter_in_objects(get_managed_objects(), pattern)
+        return find_adapter_in_objects(get_managed_objects(), pattern)
 
 def find_adapter_in_objects(objects, pattern=None):
-	bus = dbus.SystemBus()
-	for path, ifaces in objects.iteritems():
-		adapter = ifaces.get(ADAPTER_INTERFACE)
-		if adapter is None:
-			continue
-		if not pattern or path.endswith(pattern):
-			obj = bus.get_object(SERVICE_NAME, path)
-			return dbus.Interface(obj, ADAPTER_INTERFACE)
-	raise Exception("NFC adapter not found")
+        bus = dbus.SystemBus()
+        for path, ifaces in objects.iteritems():
+                adapter = ifaces.get(ADAPTER_INTERFACE)
+                if adapter is None:
+                        continue
+                if not pattern or path.endswith(pattern):
+                        obj = bus.get_object(SERVICE_NAME, path)
+                        return dbus.Interface(obj, ADAPTER_INTERFACE)
+        raise Exception("NFC adapter not found")
 
 def find_device(pattern=None):
-	return find_device_in_objects(get_managed_objects(), pattern)
+        return find_device_in_objects(get_managed_objects(), pattern)
 
 def find_device_in_objects(objects, pattern=None):
-	bus = dbus.SystemBus()
-	for path, ifaces in objects.iteritems():
-		device = ifaces.get(DEVICE_INTERFACE)
-		if device is None:
-			continue
-		if not pattern or path.endswith(pattern):
-			obj = bus.get_object(SERVICE_NAME, path)
-			return dbus.Interface(obj, DEVICE_INTERFACE)
-	raise Exception("NFC device not found")
+        bus = dbus.SystemBus()
+        for path, ifaces in objects.iteritems():
+                device = ifaces.get(DEVICE_INTERFACE)
+                if device is None:
+                        continue
+                if not pattern or path.endswith(pattern):
+                        obj = bus.get_object(SERVICE_NAME, path)
+                        return dbus.Interface(obj, DEVICE_INTERFACE)
+        raise Exception("NFC device not found")
 
 def find_tag(pattern=None):
-	return find_tag_in_objects(get_managed_objects(), pattern)
+        return find_tag_in_objects(get_managed_objects(), pattern)
 
 def find_tag_in_objects(objects, pattern=None):
-	bus = dbus.SystemBus()
-	for path, ifaces in objects.iteritems():
-		tag = ifaces.get(TAG_INTERFACE)
-		if tag is None:
-			continue
-		if not pattern or path.endswith(pattern):
-			obj = bus.get_object(SERVICE_NAME, path)
-			return dbus.Interface(obj, TAG_INTERFACE)
-	raise Exception("NFC tag not found")
+        bus = dbus.SystemBus()
+        for path, ifaces in objects.iteritems():
+                tag = ifaces.get(TAG_INTERFACE)
+                if tag is None:
+                        continue
+                if not pattern or path.endswith(pattern):
+                        obj = bus.get_object(SERVICE_NAME, path)
+                        return dbus.Interface(obj, TAG_INTERFACE)
+        raise Exception("NFC tag not found")
 
 def find_record(pattern=None):
-	return find_record_in_objects(get_managed_objects(), pattern)
+        return find_record_in_objects(get_managed_objects(), pattern)
 
 def find_record_in_objects(objects, pattern=None):
-	bus = dbus.SystemBus()
-	for path, ifaces in objects.iteritems():
-		record = ifaces.get(RECORD_INTERFACE)
-		if record is None:
-			continue
-		if not pattern or path.endswith(pattern):
-			obj = bus.get_object(SERVICE_NAME, path)
-			return dbus.Interface(obj, RECORD_INTERFACE)
-	raise Exception("NFC record not found")
+        bus = dbus.SystemBus()
+        for path, ifaces in objects.iteritems():
+                record = ifaces.get(RECORD_INTERFACE)
+                if record is None:
+                        continue
+                if not pattern or path.endswith(pattern):
+                        obj = bus.get_object(SERVICE_NAME, path)
+                        return dbus.Interface(obj, RECORD_INTERFACE)
+        raise Exception("NFC record not found")
 
 def dump_record(record_path):
-	bus = dbus.SystemBus()
-	record_prop = dbus.Interface(bus.get_object(SERVICE_NAME, record_path),
-					"org.freedesktop.DBus.Properties")
+        bus = dbus.SystemBus()
+        record_prop = dbus.Interface(bus.get_object(SERVICE_NAME, record_path),
+                                        "org.freedesktop.DBus.Properties")
 
-	properties = record_prop.GetAll(RECORD_INTERFACE)
+        properties = record_prop.GetAll(RECORD_INTERFACE)
 
-	for key in properties.keys():
-		if key in ["Representation"]:
-			val = unicode(properties[key])
-		else:
-			val = str(properties[key])
-		print "      %s = %s" % (key, val)
+        for key in properties.keys():
+                if key in ["Representation"]:
+                        val = unicode(properties[key])
+                else:
+                        val = str(properties[key])
+                print "      %s = %s" % (key, val)
 
 def dump_all_records(path):
-	bus = dbus.SystemBus()
-	om = dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
-					"org.freedesktop.DBus.ObjectManager")
-	objects = om.GetManagedObjects()
-	for path, interfaces in objects.iteritems():
-		if RECORD_INTERFACE not in interfaces:
-			continue
+        bus = dbus.SystemBus()
+        om = dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
+                                        "org.freedesktop.DBus.ObjectManager")
+        objects = om.GetManagedObjects()
+        for path, interfaces in objects.iteritems():
+                if RECORD_INTERFACE not in interfaces:
+                        continue
 
-		if path.startswith(path):
-			print("  [ %s ]" % (path))
-			dump_record(path)
+                if path.startswith(path):
+                        print("  [ %s ]" % (path))
+                        dump_record(path)
diff --git a/test/phdc-simple-manager b/test/phdc-simple-manager
index 4fd25df541d8..e802c5a3252c 100755
--- a/test/phdc-simple-manager
+++ b/test/phdc-simple-manager
@@ -42,38 +42,38 @@ assoc_release_res = "E50000020000"
 #========================================
 # Display helper
 def hexdump( chars, sep, width ):
-	while chars:
-		line = chars[:width]
-		chars = chars[width:]
-		line = line.ljust( width, '\000' )
-		print "%s%s%s" % ( sep.join( "%02x" % ord(c) for c in line ),
-			 sep, quotechars( line ))
+        while chars:
+                line = chars[:width]
+                chars = chars[width:]
+                line = line.ljust( width, '\000' )
+                print "%s%s%s" % ( sep.join( "%02x" % ord(c) for c in line ),
+                         sep, quotechars( line ))
 
 
 def quotechars( chars ):
-	return ''.join( ['.', c][c.isalnum()] for c in chars )
+        return ''.join( ['.', c][c.isalnum()] for c in chars )
 
 #========================================
 class PhdcPeerManager:
     def __init__(self, agent_fd):
-	#Grab the agent ....
-	print 'Init PhdcPeerManager thread'
-	self.r_fd = agent_fd.take()
-	print 'Agent fd:', str(self.r_fd)
+        #Grab the agent ....
+        print 'Init PhdcPeerManager thread'
+        self.r_fd = agent_fd.take()
+        print 'Agent fd:', str(self.r_fd)
 
     def run( self):
-	print 'Run PhdcPeerManager thread: ', str(self.r_fd)
-	self.sock = socket.fromfd(self.r_fd, AF_NFC, socket.SOCK_STREAM)
+        print 'Run PhdcPeerManager thread: ', str(self.r_fd)
+        self.sock = socket.fromfd(self.r_fd, AF_NFC, socket.SOCK_STREAM)
         try:
             while True:
-		miu = self.sock.getsockopt(SOL_NFC, NFC_LLCP_MIUX)
-		print 'MIU=', miu
+                miu = self.sock.getsockopt(SOL_NFC, NFC_LLCP_MIUX)
+                print 'MIU=', miu
 
                 while True:
                     data = self.sock.recv(16)
                     if data == None:
-		       print 'no data'
-		       break
+                       print 'no data'
+                       break
 
                    #analyze frame
                     print 'analyze'
@@ -104,90 +104,90 @@ class PhdcPeerManager:
                 self.sock.close()
 
         except IOError as e:
-		if e.errno == errno.EPIPE:
-			print 'Remote disconnect'
-		else:
-			print "I/O error({0}): {1}".format(e.errno, e.strerror)
+                if e.errno == errno.EPIPE:
+                        print 'Remote disconnect'
+                else:
+                        print "I/O error({0}): {1}".format(e.errno, e.strerror)
         finally:
-		print 'Finally exit'
-		stop()
+                print 'Finally exit'
+                stop()
 
-	def stop(self):
-		print 'Stop PhdcPeerManager:', str(self.r_fd)
-		self._Thread__stop()
+        def stop(self):
+                print 'Stop PhdcPeerManager:', str(self.r_fd)
+                self._Thread__stop()
 
 #===================================================
 ''' Phdc Manager Class
 '''
 class SimplePhdcManager(dbus.service.Object):
 
-	@dbus.service.method('org.neard.PHDC.Manager',
-					in_signature='',
-					out_signature='')
-	def Release(self):
-		print 'Release'
-		mainloop.quit()
-
-
-	''' Called on incoming agents
-	'''
-	@dbus.service.method('org.neard.PHDC.Manager',
-					in_signature='h',
-					out_signature='')
-	def NewConnection(self, agent_fd):
-		print'Launch Phdc Manager thread for fd:', str(agent_fd)
-		self.server = PhdcPeerManager(agent_fd)
-		print'Run Server'
-		self.server.run()
-		print'Leave Server'
-		return
-
-	''' Called when the agent ends (from phdc_close)
-	'''
-	@dbus.service.method('org.neard.PHDC.Manager',
-					in_signature='hi', out_signature='')
-	def Disconnection(self,agent_fd, i_err):
-		print'Stop Phdc Manager thread'
-		self.server.stop()
-		return
+        @dbus.service.method('org.neard.PHDC.Manager',
+                                        in_signature='',
+                                        out_signature='')
+        def Release(self):
+                print 'Release'
+                mainloop.quit()
+
+
+        ''' Called on incoming agents
+        '''
+        @dbus.service.method('org.neard.PHDC.Manager',
+                                        in_signature='h',
+                                        out_signature='')
+        def NewConnection(self, agent_fd):
+                print'Launch Phdc Manager thread for fd:', str(agent_fd)
+                self.server = PhdcPeerManager(agent_fd)
+                print'Run Server'
+                self.server.run()
+                print'Leave Server'
+                return
+
+        ''' Called when the agent ends (from phdc_close)
+        '''
+        @dbus.service.method('org.neard.PHDC.Manager',
+                                        in_signature='hi', out_signature='')
+        def Disconnection(self,agent_fd, i_err):
+                print'Stop Phdc Manager thread'
+                self.server.stop()
+                return
 
 ''' Main loop
 This sample installs two PHDC Managers:
-	* Simple: simulates a thermometer data exchange
-	* Validation: Validation Manager for NFC Forum PHDC)
+        * Simple: simulates a thermometer data exchange
+        * Validation: Validation Manager for NFC Forum PHDC)
 '''
 if "__main__" == __name__:
-	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+        dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
 
-	print 'PHDC Simple Manager Test'
-	bus = dbus.SystemBus()
-	obj = bus.get_object("org.neard", "/org/neard");
-	neard_manager = dbus.Interface(obj, "org.neard.PHDC")
+        print 'PHDC Simple Manager Test'
+        bus = dbus.SystemBus()
+        obj = bus.get_object("org.neard", "/org/neard");
+        neard_manager = dbus.Interface(obj, "org.neard.PHDC")
 
-	simple_path = '/Simple'
-	valid_path = '/Validation'
+        simple_path = '/Simple'
+        valid_path = '/Validation'
 
-	print 'Creating & registering PHDC Simple Manager'
-	simpleobject = SimplePhdcManager(bus, simple_path)
+        print 'Creating & registering PHDC Simple Manager'
+        simpleobject = SimplePhdcManager(bus, simple_path)
 
-	d = dbus.Dictionary({'Role': 'Manager', 'Path': simple_path,
-			'ServiceName': 'urn:nfc:sn:phdc' }, signature='sv')
-	neard_manager.RegisterAgent(d)
+        d = dbus.Dictionary({'Role': 'Manager', 'Path': simple_path,
+                        'ServiceName': 'urn:nfc:sn:phdc' }, signature='sv')
+        neard_manager.RegisterAgent(d)
 
-	print 'Creating & Registering Validation Manager'
+        print 'Creating & Registering Validation Manager'
 
-	validationobj= SimplePhdcManager(bus, valid_path)
-	d = dbus.Dictionary({'Role': 'Manager', 'Path': valid_path,
-		'ServiceName': 'urn:nfc:xsn:nfc-forum.org:phdc-validation' },
-		 signature='sv')
-	neard_manager.RegisterAgent(d)
+        validationobj= SimplePhdcManager(bus, valid_path)
+        d = dbus.Dictionary({'Role': 'Manager', 'Path': valid_path,
+                'ServiceName': 'urn:nfc:xsn:nfc-forum.org:phdc-validation' },
+                 signature='sv')
+        neard_manager.RegisterAgent(d)
 
-	mainloop = gobject.MainLoop()
+        mainloop = gobject.MainLoop()
 
 try:
         mainloop.run()
 
 except(KeyboardInterrupt):
-	#Call for unregister...
+        #Call for unregister...
         neard_manager.UnregisterAgent(simple_path, 'Manager')
         neard_manager.UnregisterAgent(valid_path, 'Manager')
diff --git a/test/test-adapter b/test/test-adapter
index 173519e46d99..93b6f96e33ca 100755
--- a/test/test-adapter
+++ b/test/test-adapter
@@ -7,101 +7,101 @@ import neardutils
 bus = dbus.SystemBus()
 
 def extract_list(list):
-	val = "["
-	for i in list:
-		val += " " + str(i)
-	val += " ]"
-	return val
+        val = "["
+        for i in list:
+                val += " " + str(i)
+        val += " ]"
+        return val
 
 def usage():
-	print("Usage: %s <command>" % (sys.argv[0]) )
-	print("")
-	print("  list")
-	print("  powered nfcX [on/off]")
-	print("  poll nfcX [on/off] [Initiator/Target/Dual]")
-	sys.exit(1)
+        print("Usage: %s <command>" % (sys.argv[0]) )
+        print("")
+        print("  list")
+        print("  powered nfcX [on/off]")
+        print("  poll nfcX [on/off] [Initiator/Target/Dual]")
+        sys.exit(1)
 
 if (len(sys.argv) < 2):
-	usage()
+        usage()
 
 if (sys.argv[1] == "list"):
-	if (len(sys.argv) < 3):
-		objects = neardutils.get_managed_objects()
-		for path, interfaces in objects.iteritems():
-			if "org.neard.Adapter" not in interfaces:
-				continue
+        if (len(sys.argv) < 3):
+                objects = neardutils.get_managed_objects()
+                for path, interfaces in objects.iteritems():
+                        if "org.neard.Adapter" not in interfaces:
+                                continue
 
-			print(" [ %s ]" % (path))
+                        print(" [ %s ]" % (path))
 
-			props = interfaces["org.neard.Adapter"]
+                        props = interfaces["org.neard.Adapter"]
 
-			for (key, value) in props.items():
-				if (key == "Protocols"):
-					val = extract_list(value)
-					print("    %s = %s" % (key, val))
+                        for (key, value) in props.items():
+                                if (key == "Protocols"):
+                                        val = extract_list(value)
+                                        print("    %s = %s" % (key, val))
 
-				elif key in ["Powered", "Polling"]:
-					if value == dbus.Boolean(1):
-						val = "true"
-					else:
-						val = "false"
-					print("    %s = %s" % (key, val))
+                                elif key in ["Powered", "Polling"]:
+                                        if value == dbus.Boolean(1):
+                                                val = "true"
+                                        else:
+                                                val = "false"
+                                        print("    %s = %s" % (key, val))
 
-				else:
-					print("    %s = %s" % (key, value))
+                                else:
+                                        print("    %s = %s" % (key, value))
 
-		sys.exit(0)
+                sys.exit(0)
 
 if (sys.argv[1] == "powered"):
-	if (len(sys.argv) < 4):
-		usage()
-	else:
-		path = "/org/neard/" + sys.argv[2]
-
-		adapter_path = neardutils.find_adapter(path).object_path
-		adapter = dbus.Interface(bus.get_object("org.neard", adapter_path),
-					"org.freedesktop.DBus.Properties")
-
-		if (sys.argv[3] == "on"):
-			value = dbus.Boolean(1)
-		elif (sys.argv[3] == "off"):
-			value = dbus.Boolean(0)
-		else:
-			value = dbus.Boolean(sys.argv[3])
-		try:
-			adapter.Set("org.neard.Adapter", "Powered", value)
-		except dbus.DBusException, error:
-			print "%s: %s" % (error._dbus_error_name, error.message)
-	sys.exit(0)
+        if (len(sys.argv) < 4):
+                usage()
+        else:
+                path = "/org/neard/" + sys.argv[2]
+
+                adapter_path = neardutils.find_adapter(path).object_path
+                adapter = dbus.Interface(bus.get_object("org.neard", adapter_path),
+                                        "org.freedesktop.DBus.Properties")
+
+                if (sys.argv[3] == "on"):
+                        value = dbus.Boolean(1)
+                elif (sys.argv[3] == "off"):
+                        value = dbus.Boolean(0)
+                else:
+                        value = dbus.Boolean(sys.argv[3])
+                try:
+                        adapter.Set("org.neard.Adapter", "Powered", value)
+                except dbus.DBusException, error:
+                        print "%s: %s" % (error._dbus_error_name, error.message)
+        sys.exit(0)
 
 if (sys.argv[1] == "poll"):
-	if (len(sys.argv) < 4):
-		usage()
-	else:
-		path = "/org/neard/" + sys.argv[2]
-
-		adapter = neardutils.find_adapter(path)
-
-		if (sys.argv[3] == "on"):
-			if (len(sys.argv) == 4):
-				mode = "Initiator"
-			else:
-				mode = sys.argv[4]
-
-			try:
-				adapter.StartPollLoop(mode)
-			except dbus.DBusException, error:
-				print "%s: %s" % (error._dbus_error_name, error.message)
-
-		elif (sys.argv[3] == "off"):
-			try:
-				adapter.StopPollLoop()
-			except dbus.DBusException, error:
-				print "%s: %s" % (error._dbus_error_name, error.message)
-
-		else:
-			usage()
-
-	sys.exit(0)
+        if (len(sys.argv) < 4):
+                usage()
+        else:
+                path = "/org/neard/" + sys.argv[2]
+
+                adapter = neardutils.find_adapter(path)
+
+                if (sys.argv[3] == "on"):
+                        if (len(sys.argv) == 4):
+                                mode = "Initiator"
+                        else:
+                                mode = sys.argv[4]
+
+                        try:
+                                adapter.StartPollLoop(mode)
+                        except dbus.DBusException, error:
+                                print "%s: %s" % (error._dbus_error_name, error.message)
+
+                elif (sys.argv[3] == "off"):
+                        try:
+                                adapter.StopPollLoop()
+                        except dbus.DBusException, error:
+                                print "%s: %s" % (error._dbus_error_name, error.message)
+
+                else:
+                        usage()
+
+        sys.exit(0)
 
 usage()
diff --git a/test/test-device b/test/test-device
index 1c90ef1e5d32..bc66ce3f01cd 100755
--- a/test/test-device
+++ b/test/test-device
@@ -7,110 +7,110 @@ import neardutils
 bus = dbus.SystemBus()
 
 def extract_list(list):
-	val = "["
-	for i in list:
-		val += " " + str(i)
-	val += " ]"
-	return val
+        val = "["
+        for i in list:
+                val += " " + str(i)
+        val += " ]"
+        return val
 
 def usage():
-	print("Usage: %s <command>" % (sys.argv[0]) )
-	print("")
-	print("  list")
-	print("  dump <device>")
-	print("  push <device> <type> <...>")
-	print "	   If type is Text, parameters are <encoding> <language> <representation>"
-	print "	   If type is URI, parameters are <uri>"
-	print "	   If type is SmartPoster, parameters are <uri>"
-	print "	   If type is Handover, parameters are <carrier>"
-	print "	   If type is StaticHandover, parameters are <carrier>"
-	print "    If type is MIME, parameters are <mime_type> (only wifi_wsc and raw)"
-	print "       raw is for sending raw payload, parameters are <mime_type> <payload>"
-	print "e.g. < %s push /org/neard/nfc0/device0 Text UTF-8 en-US hello,Type2! >" % (sys.argv[0])
-	print "e.g. < %s push /org/neard/nfc0/device0 URI http://www.nfc-forum.com >" % (sys.argv[0])
-	print "e.g. < %s push /org/neard/nfc0/device0 SmartPoster http://www.nfc-forum.com >" % (sys.argv[0])
-	print "e.g. < %s push /org/neard/nfc0/device0 Handover bluetooth,wifi >" % (sys.argv[0])
-	print "e.g. < %s push /org/neard/nfc0/device0 StaticHandover bluetooth,wifi >" % (sys.argv[0])
-	print "e.g. < %s push /org/neard/nfc0/device0 MIME wifi_wsc>" % (sys.argv[0])
-	print "e.g. < %s push /org/neard/nfc0/device0 MIME raw application/xml '<your><xml tags></your>' >" % (sys.argv[0])
-
-	sys.exit(1)
+        print("Usage: %s <command>" % (sys.argv[0]) )
+        print("")
+        print("  list")
+        print("  dump <device>")
+        print("  push <device> <type> <...>")
+        print "    If type is Text, parameters are <encoding> <language> <representation>"
+        print "    If type is URI, parameters are <uri>"
+        print "    If type is SmartPoster, parameters are <uri>"
+        print "    If type is Handover, parameters are <carrier>"
+        print "    If type is StaticHandover, parameters are <carrier>"
+        print "    If type is MIME, parameters are <mime_type> (only wifi_wsc and raw)"
+        print "       raw is for sending raw payload, parameters are <mime_type> <payload>"
+        print "e.g. < %s push /org/neard/nfc0/device0 Text UTF-8 en-US hello,Type2! >" % (sys.argv[0])
+        print "e.g. < %s push /org/neard/nfc0/device0 URI http://www.nfc-forum.com >" % (sys.argv[0])
+        print "e.g. < %s push /org/neard/nfc0/device0 SmartPoster http://www.nfc-forum.com >" % (sys.argv[0])
+        print "e.g. < %s push /org/neard/nfc0/device0 Handover bluetooth,wifi >" % (sys.argv[0])
+        print "e.g. < %s push /org/neard/nfc0/device0 StaticHandover bluetooth,wifi >" % (sys.argv[0])
+        print "e.g. < %s push /org/neard/nfc0/device0 MIME wifi_wsc>" % (sys.argv[0])
+        print "e.g. < %s push /org/neard/nfc0/device0 MIME raw application/xml '<your><xml tags></your>' >" % (sys.argv[0])
+
+        sys.exit(1)
 
 if (len(sys.argv) < 2):
-	usage()
+        usage()
 
 if (sys.argv[1] == "list"):
-	if (len(sys.argv) < 3):
-		objects = neardutils.get_managed_objects()
-		for path, interfaces in objects.iteritems():
-			if "org.neard.Device" not in interfaces:
-				continue
+        if (len(sys.argv) < 3):
+                objects = neardutils.get_managed_objects()
+                for path, interfaces in objects.iteritems():
+                        if "org.neard.Device" not in interfaces:
+                                continue
 
-			print(" [ %s ]" % (path))
+                        print(" [ %s ]" % (path))
 
-			props = interfaces["org.neard.Device"]
+                        props = interfaces["org.neard.Device"]
 
-			for (key, value) in props.items():
-				print("    %s = %s" % (key, value))
+                        for (key, value) in props.items():
+                                print("    %s = %s" % (key, value))
 
-		sys.exit(0)
+                sys.exit(0)
 
 if (sys.argv[1] == "dump"):
-	if (len(sys.argv) < 3):
-		objects = neardutils.get_managed_objects()
-		for path, interfaces in objects.iteritems():
-			if "org.neard.Device" not in interfaces:
-				continue
+        if (len(sys.argv) < 3):
+                objects = neardutils.get_managed_objects()
+                for path, interfaces in objects.iteritems():
+                        if "org.neard.Device" not in interfaces:
+                                continue
 
-			print("[ %s ]" % (path))
-			neardutils.dump_all_records(path)
+                        print("[ %s ]" % (path))
+                        neardutils.dump_all_records(path)
 
-		sys.exit(0)
-	else:
-		neardutils.dump_all_records(sys.argv[2])
+                sys.exit(0)
+        else:
+                neardutils.dump_all_records(sys.argv[2])
 
-		sys.exit(0)
+                sys.exit(0)
 
 if (sys.argv[1] == "push"):
-   	if (len(sys.argv) < 5):
-		usage()
-	
-	device = neardutils.find_device(sys.argv[2])
-
-	if len(sys.argv) == 7:
-		if sys.argv[3] in ["Text"]:
-			device.Push(({ "Type" : "Text",
-				"Encoding" : sys.argv[4],
-				"Language" : sys.argv[5],
-				"Representation" : sys.argv[6] }))
-		elif sys.argv[3] in ["MIME"]:
-			if sys.argv[4] in ["raw"]:
-				device.Push(({ "Type" : "MIME",
-				       "MIME" : sys.argv[5],
-				       "Payload" : dbus.ByteArray(sys.argv[6]) }))
-		else:
-			usage()
-
-	elif len(sys.argv) == 5:
-		if sys.argv[3] in ["URI"]:
-			device.Push(({ "Type" : "URI",
-				"URI" : sys.argv[4] }))
-		elif sys.argv[3] in ["SmartPoster"]:
-		     	device.Push(({ "Type" : "SmartPoster",
-				"URI" : sys.argv[4] }))
-		elif sys.argv[3] in ["Handover"]:
-		     	device.Push(({ "Type" : "Handover",
-				"Carrier" : sys.argv[4] }))
-		elif sys.argv[3] in ["StaticHandover"]:
-		     	device.Push(({ "Type" : "StaticHandover",
-				"Carrier" : sys.argv[4] }))
-		elif sys.argv[3] in ["MIME"]:
-		     	if sys.argv[4] in ["wifi_wsc"]:
-				device.Push(({ "Type" : "MIME",
-					"MIME" : "application/vnd.wfa.wsc"}))
-		else:
-			usage()
-	else:
-		usage()
-
-	sys.exit(0)
+        if (len(sys.argv) < 5):
+                usage()
+        
+        device = neardutils.find_device(sys.argv[2])
+
+        if len(sys.argv) == 7:
+                if sys.argv[3] in ["Text"]:
+                        device.Push(({ "Type" : "Text",
+                                "Encoding" : sys.argv[4],
+                                "Language" : sys.argv[5],
+                                "Representation" : sys.argv[6] }))
+                elif sys.argv[3] in ["MIME"]:
+                        if sys.argv[4] in ["raw"]:
+                                device.Push(({ "Type" : "MIME",
+                                       "MIME" : sys.argv[5],
+                                       "Payload" : dbus.ByteArray(sys.argv[6]) }))
+                else:
+                        usage()
+
+        elif len(sys.argv) == 5:
+                if sys.argv[3] in ["URI"]:
+                        device.Push(({ "Type" : "URI",
+                                "URI" : sys.argv[4] }))
+                elif sys.argv[3] in ["SmartPoster"]:
+                        device.Push(({ "Type" : "SmartPoster",
+                                "URI" : sys.argv[4] }))
+                elif sys.argv[3] in ["Handover"]:
+                        device.Push(({ "Type" : "Handover",
+                                "Carrier" : sys.argv[4] }))
+                elif sys.argv[3] in ["StaticHandover"]:
+                        device.Push(({ "Type" : "StaticHandover",
+                                "Carrier" : sys.argv[4] }))
+                elif sys.argv[3] in ["MIME"]:
+                        if sys.argv[4] in ["wifi_wsc"]:
+                                device.Push(({ "Type" : "MIME",
+                                        "MIME" : "application/vnd.wfa.wsc"}))
+                else:
+                        usage()
+        else:
+                usage()
+
+        sys.exit(0)
diff --git a/test/test-tag b/test/test-tag
index cb2c9e84d7fa..9f7f58851cc9 100755
--- a/test/test-tag
+++ b/test/test-tag
@@ -7,176 +7,176 @@ import neardutils
 bus = dbus.SystemBus()
 
 def usage():
-	print("Usage: %s <command>" % sys.argv[0])
-	text = """
+        print("Usage: %s <command>" % sys.argv[0])
+        text = """
 list
 dump <tag>
 deactivate <tag>
 write <tag> <type> <...>
 
-	If type is Text, parameters are <encoding> <language> <representation>
-	If type is URI, parameters are <uri>
-	If type is SmartPoster, parameters are <uri>
-	If type is SMS, parameters are <phone number> <text>
-	If type is E-Mail, parameters are <e-mail address>
-	If type is MIME, and WiFi AP is passphrase protected
-		Type is MIME, parameters are wifi_wsc <ssid> <passphrase>
-	If type is MIME, and WiFi AP is open network
-		Type is MIME, parameters are wifi_wsc <ssid>
-	For MIME with arbitrary content, parameters are:
-			<ContentType> <Content>
+        If type is Text, parameters are <encoding> <language> <representation>
+        If type is URI, parameters are <uri>
+        If type is SmartPoster, parameters are <uri>
+        If type is SMS, parameters are <phone number> <text>
+        If type is E-Mail, parameters are <e-mail address>
+        If type is MIME, and WiFi AP is passphrase protected
+                Type is MIME, parameters are wifi_wsc <ssid> <passphrase>
+        If type is MIME, and WiFi AP is open network
+                Type is MIME, parameters are wifi_wsc <ssid>
+        For MIME with arbitrary content, parameters are:
+                        <ContentType> <Content>
 
 For example: # %s write /org/neard/nfc0/tag0 \\
-	Text UTF-8 en-US hello,NFC!
-	URI http://www.nfc-forum.com
-	SmartPoster http://www.nfc-forum.com
-	SMS 0102030405 YourSMSMessage
-	E-Mail test@test.com
-	MIME wifi_wsc YourAPname passphrase
-	MIME wifi_wsc YourAPname
-	MIME 'application/octet-stream' 1234
+        Text UTF-8 en-US hello,NFC!
+        URI http://www.nfc-forum.com
+        SmartPoster http://www.nfc-forum.com
+        SMS 0102030405 YourSMSMessage
+        E-Mail test@test.com
+        MIME wifi_wsc YourAPname passphrase
+        MIME wifi_wsc YourAPname
+        MIME 'application/octet-stream' 1234
 """
-	print(text % sys.argv[0])
+        print(text % sys.argv[0])
 
-	sys.exit(1)
+        sys.exit(1)
 
 if (len(sys.argv) < 2):
-	usage()
+        usage()
 
 if (sys.argv[1] == "list"):
-	if (len(sys.argv) < 3):
-		objects = neardutils.get_managed_objects()
-		for path, interfaces in objects.iteritems():
-			if "org.neard.Tag" not in interfaces:
-				continue
+        if (len(sys.argv) < 3):
+                objects = neardutils.get_managed_objects()
+                for path, interfaces in objects.iteritems():
+                        if "org.neard.Tag" not in interfaces:
+                                continue
 
-			print(" [ %s ]" % (path))
+                        print(" [ %s ]" % (path))
 
-			props = interfaces["org.neard.Tag"]
+                        props = interfaces["org.neard.Tag"]
 
-			for (key, value) in props.items():
-				if key in ["ReadOnly"]:
-					if value == dbus.Boolean(1):
-						val = "true"
-					else:
-						val = "false"
-					print("    %s = %s" % (key, val))
+                        for (key, value) in props.items():
+                                if key in ["ReadOnly"]:
+                                        if value == dbus.Boolean(1):
+                                                val = "true"
+                                        else:
+                                                val = "false"
+                                        print("    %s = %s" % (key, val))
 
-				else:
-					print("    %s = %s" % (key, value))
+                                else:
+                                        print("    %s = %s" % (key, value))
 
-		sys.exit(0)
+                sys.exit(0)
 
 if (sys.argv[1] == "dump"):
-	if (len(sys.argv) < 3):
-		objects = neardutils.get_managed_objects()
-		for path, interfaces in objects.iteritems():
-			if "org.neard.Tag" not in interfaces:
-				continue
+        if (len(sys.argv) < 3):
+                objects = neardutils.get_managed_objects()
+                for path, interfaces in objects.iteritems():
+                        if "org.neard.Tag" not in interfaces:
+                                continue
 
-			print("[ %s ]" % (path))
-			neardutils.dump_all_records(path)
+                        print("[ %s ]" % (path))
+                        neardutils.dump_all_records(path)
 
-		sys.exit(0)
-	else:
-		neardutils.dump_all_records(sys.argv[2])
+                sys.exit(0)
+        else:
+                neardutils.dump_all_records(sys.argv[2])
 
-		sys.exit(0)
+                sys.exit(0)
 
 def write_mime(args):
 
-	data = { "Type" : "MIME" }
+        data = { "Type" : "MIME" }
 
-	if len(args) < 2:
-		usage()
+        if len(args) < 2:
+                usage()
 
-	if args[0] == "wifi_wsc":
+        if args[0] == "wifi_wsc":
 
-		data["MIME"] = "application/vnd.wfa.wsc"
-		data["SSID"] = args[1]
+                data["MIME"] = "application/vnd.wfa.wsc"
+                data["SSID"] = args[1]
 
-		if len(args) > 2:
+                if len(args) > 2:
 
-			data["Passphrase"] = args[2]
-	else:
-		data["MIME"] = args[0]
-		data["MIMEPayload"] = dbus.ByteArray(args[1])
+                        data["Passphrase"] = args[2]
+        else:
+                data["MIME"] = args[0]
+                data["MIMEPayload"] = dbus.ByteArray(args[1])
 
-	tag.Write(data)
+        tag.Write(data)
 
 def write_uri(args):
 
-	data = { }
-	records = [ ]
+        data = { }
+        records = [ ]
 
-	if len(args) > 1:
+        if len(args) > 1:
 
-		for i in args:
+                for i in args:
 
-			record = { }
+                        record = { }
 
-			record["Type"] = dbus.String("URI", variant_level = 1)
-			record["URI"] = dbus.String(i, variant_level = 1)
+                        record["Type"] = dbus.String("URI", variant_level = 1)
+                        record["URI"] = dbus.String(i, variant_level = 1)
 
-			records.append(record)
+                        records.append(record)
 
-		data["Records"] = records
+                data["Records"] = records
 
-	else:
+        else:
 
-		data["Type"] = "URI"
-		data["URI"] = args[0]
+                data["Type"] = "URI"
+                data["URI"] = args[0]
 
-	print data
+        print data
 
-	tag.Write(data)
+        tag.Write(data)
 
 if (sys.argv[1] == "write"):
-	if (len(sys.argv) < 5):
-		usage()
+        if (len(sys.argv) < 5):
+                usage()
 
-	tag = neardutils.find_tag(sys.argv[2])
+        tag = neardutils.find_tag(sys.argv[2])
 
-	if sys.argv[3] in ["Text"]:
-		tag.Write(({ "Type" : "Text",
-			"Encoding" : sys.argv[4],
-			"Language" : sys.argv[5],
-			"Representation" : sys.argv[6] }))
+        if sys.argv[3] in ["Text"]:
+                tag.Write(({ "Type" : "Text",
+                        "Encoding" : sys.argv[4],
+                        "Language" : sys.argv[5],
+                        "Representation" : sys.argv[6] }))
 
-	elif sys.argv[3] == "URI":
-		write_uri(sys.argv[4:])
+        elif sys.argv[3] == "URI":
+                write_uri(sys.argv[4:])
 
-	elif sys.argv[3] in ["SmartPoster"]:
-		tag.Write(({ "Type" : "SmartPoster",
-			"URI" : sys.argv[4] }))
+        elif sys.argv[3] in ["SmartPoster"]:
+                tag.Write(({ "Type" : "SmartPoster",
+                        "URI" : sys.argv[4] }))
 
-	elif sys.argv[3] in ["SMS"]:
-		URI = "sms:" + sys.argv[4] + "?body=" + sys.argv[5]
-		tag.Write(({ "Type" : "URI",
-			"URI" : URI }))
+        elif sys.argv[3] in ["SMS"]:
+                URI = "sms:" + sys.argv[4] + "?body=" + sys.argv[5]
+                tag.Write(({ "Type" : "URI",
+                        "URI" : URI }))
 
-	elif sys.argv[3] in ["E-Mail"]:
-		URI = "mailto:" + sys.argv[4]
-		tag.Write(({ "Type" : "URI",
-			"URI" : URI }))
+        elif sys.argv[3] in ["E-Mail"]:
+                URI = "mailto:" + sys.argv[4]
+                tag.Write(({ "Type" : "URI",
+                        "URI" : URI }))
 
-	elif sys.argv[3] in ["MIME"]:
-		write_mime(sys.argv[4:])
+        elif sys.argv[3] in ["MIME"]:
+                write_mime(sys.argv[4:])
 
-	else:
-		usage()
+        else:
+                usage()
 
-	sys.exit(0)
+        sys.exit(0)
 
 if (sys.argv[1] == "deactivate"):
-	print sys.argv[2]
-	if (len(sys.argv) != 2):
-		tag = neardutils.find_tag(sys.argv[2])
-		tag.Deactivate()
-	else:
-		usage()
+        print sys.argv[2]
+        if (len(sys.argv) != 2):
+                tag = neardutils.find_tag(sys.argv[2])
+                tag.Deactivate()
+        else:
+                usage()
 
-	sys.exit(0)
+        sys.exit(0)
 
 else:
-	usage()
+        usage()
-- 
2.33.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
