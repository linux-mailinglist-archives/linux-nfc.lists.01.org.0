Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 966E2460E4B
	for <lists+linux-nfc@lfdr.de>; Mon, 29 Nov 2021 06:06:36 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 51064100EA2CD;
	Sun, 28 Nov 2021 21:06:34 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id AF683100EAB0E
	for <linux-nfc@lists.01.org>; Sun, 28 Nov 2021 21:06:31 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id AEC2132009A1;
	Mon, 29 Nov 2021 00:06:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 29 Nov 2021 00:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=C7YuIKEO8gAo0
	1i69pEV1ZEjFnQMHyrFGby99gmNIL0=; b=P1jWWALCnFknlqPaRIPQPnOdPmNKD
	Y7qrkTr9YkfCqLgoYtsck2+xN5CWZCloeIJXjJlGH1ng4EYbUePNHw3X9sOkb4FL
	IURfsXvnf8p9iIQn0+XUoytO+TU5MZWn6Zz/RxXozvaqLsCjo1m5Z+XJQyLjaVWo
	II+s9wlZC0QgHxt3EA6LSPlyzMu50DOcwYThOqiPAFKRguT1gtkJQWimbiYxc1Cx
	rxh+lTO8pTKyhFklLYj4hHwkJ5/A42hGxJ0Qqq8YjM/Vi5xG2ju+7htC11VBCMlA
	nk/4B40/Qpg9bUYPxcz5PmAYuWrpTibkf9yZdAFy+Gd7J6W5rv1dcgTkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=C7YuIKEO8gAo01i69pEV1ZEjFnQMHyrFGby99gmNIL0=; b=SZIfzLtL
	d8Hb1WVwCc/ziC0TqOAXaLH/VdrlkRKeFOxbgsCjrlEd0sIIlY38HmXyxGFTQ6S+
	YAU7ETdFlX14LEt7XP0F02zJjY8BKDRthycZRPs5fpwvxy9+m0RkN2sUVRWEnO7D
	56oh/ax9JbyN/nfxwTrhLW+j1AE44IKwXPiBBkb0E9G06lAQfUHu2H7ZPRAwdbfj
	iDIkH6gWmoFKwQBqxIuMMp78NxFCSN+uVaigc/L0IUDGkaDJQmnhnfY+zksBUWcQ
	70INzVC5ckev0De9FvgDfHIqK7UQudTRLJRiSRefelQWG+j4qkrwNsOU4WoTx2Mz
	F0vCuhx2eIa98Q==
X-ME-Sender: <xms:1l-kYSoy3arc9Nmwc03zeZKVm8r7mDHL8yaKEowXVHAEKnK6nVc6nA>
    <xme:1l-kYQo07m2mbKCfj5w3MmcuXI3AOjg1lU1wKWsLalL5GePRd1KoQJJLMRbjcUrgq
    9HE84_MsRWVI871vw>
X-ME-Received: <xmr:1l-kYXN8xW1XckBvbXByykCiOwy892LO5X71ocOx-7MmfM091X1QXJJHsM4iMT2cE_xyf42uI300tQ0WBjLYbOM3bH_Iom0OIHlfnWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforghrkhcuifhrvggvrhcuoehmghhrvggvrh
    esrghnihhmrghltghrvggvkhdrtghomheqnecuggftrfgrthhtvghrnhepleeivdelvedt
    hedttddtkeekgfeitdduuedtfeekteevgfefteektedvfffhleelnecuffhomhgrihhnpe
    hsvghrvhgvrhdrrhhunhdpnhhftgdqfhhorhhumhdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhesrghnihhmrghltg
    hrvggvkhdrtghomh
X-ME-Proxy: <xmx:1l-kYR67zOM5fctqGQAR2KhzhToxpASUpF4qU7C_Dg_a0kqGIWUh7w>
    <xmx:1l-kYR5kNK5i4H4NlAbxFPid7TeiAVl7rwSRE40jHijv1cI9xye8QA>
    <xmx:1l-kYRgx0A54-v4h3OR2ddLXeSoHsTsWEGEVMPWyFTU1R0ntWCII2w>
    <xmx:1l-kYTTMSE6ylAg-SxrP4TmKDOjnUCsNnKeIXwkN6zxZTAuHP62bow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 00:06:29 -0500 (EST)
Received: from blue.animalcreek.com (localhost [127.0.0.1])
	by blue.animalcreek.com (Postfix) with ESMTP id 2162513604A8;
	Sun, 28 Nov 2021 22:06:29 -0700 (MST)
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Date: Sun, 28 Nov 2021 22:06:02 -0700
Message-Id: <20211129050606.873494-3-mgreer@animalcreek.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211129050606.873494-1-mgreer@animalcreek.com>
References: <20211129050606.873494-1-mgreer@animalcreek.com>
MIME-Version: 1.0
Message-ID-Hash: RNFU4ATHHA6I735GHNC3XTXCB6VR5NON
X-Message-ID-Hash: RNFU4ATHHA6I735GHNC3XTXCB6VR5NON
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 2/6] test: Convert test script from Python2 to Python3
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/RNFU4ATHHA6I735GHNC3XTXCB6VR5NON/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Python2 is deprecated so convert the neard test scripts, which are
Python2, to Python3.

Signed-off-by: Mark Greer <mgreer@animalcreek.com>
---
 test/bt-handover         |  8 ++---
 test/handover-agent      | 34 +++++++++----------
 test/monitor-near        | 10 +++---
 test/ndef-agent          | 20 ++++++------
 test/neard-ui.py         | 70 ++++++++++++++++++++--------------------
 test/neardutils.py       | 17 ++++------
 test/phdc-simple-manager | 50 ++++++++++++++--------------
 test/test-adapter        | 16 ++++-----
 test/test-device         | 34 +++++++++----------
 test/test-tag            | 10 +++---
 10 files changed, 132 insertions(+), 137 deletions(-)

diff --git a/test/bt-handover b/test/bt-handover
index fc77404da972..eebae9338e00 100755
--- a/test/bt-handover
+++ b/test/bt-handover
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 
 import os
 import sys
@@ -14,7 +14,7 @@ from dbus.lowlevel import MethodCallMessage, HANDLER_RESULT_NOT_YET_HANDLED
 mainloop = gobject.MainLoop()
 
 def device_added(path, interfaces):
-        for iface, props in interfaces.iteritems():
+        for iface, props in interfaces.items():
                 if "org.neard.Device" in interfaces:
                         print("Pairing with %s" % (path))
                         device = dbus.Interface(bus.get_object("org.neard", path),
@@ -34,7 +34,7 @@ def remove_paired_devices(bt_adapter):
                                         "org.freedesktop.DBus.ObjectManager")
         objects = manager.GetManagedObjects()
 
-        all_adapters = (path for path, interfaces in objects.iteritems() if
+        all_adapters = (path for path, interfaces in objects.items() if
                                 "org.bluez.Adapter1" in interfaces.keys()
                                 and path.endswith(bt_adapter))
 
@@ -60,7 +60,7 @@ def remove_paired_devices(bt_adapter):
                 print("Bluetooth adapter %s is not powered" % adapter_path )
                 exit()
 
-        all_devices = (path for path, interfaces in objects.iteritems() if
+        all_devices = (path for path, interfaces in objects.items() if
                                 ("org.bluez.Device1" in interfaces.keys()
                                 and path.startswith(bluez_adapter.object_path)))
 
diff --git a/test/handover-agent b/test/handover-agent
index dba00b6b9229..bed79a87cf09 100755
--- a/test/handover-agent
+++ b/test/handover-agent
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 
 import gobject
 
@@ -23,18 +23,18 @@ power_state = None
 def print_fields(fields):
         if 'EIR' in fields:
                 s = ' '.join('{:#02x}'.format(i) for i in fields['EIR'])
-                print '  EIR:  %s' % s
+                print('  EIR:  %s' % s)
 
         if 'nokia.com:bt' in fields:
                 s = ' '.join('{:#02x}'.format(i) for i in fields['nokia.com:bt'])
-                print '  nokia.com:bt:  %s' % s
+                print('  nokia.com:bt:  %s' % s)
 
         if 'State' in fields:
-                print '  State: %s' % fields['State']
+                print('  State: %s' % fields['State'])
 
         if 'WSC' in fields:
                 s = ' '.join('{:#02x}'.format(i) for i in fields['WSC'])
-                print '  WSC:  %s' % s
+                print('  WSC:  %s' % s)
 
 class BTHOAgent(dbus.service.Object):
 
@@ -42,14 +42,14 @@ class BTHOAgent(dbus.service.Object):
                                         in_signature='',
                                         out_signature='')
         def Release(self):
-                print 'Release'
+                print('Release')
                 mainloop.quit()
 
         @dbus.service.method('org.neard.HandoverAgent',
                                         in_signature='a{sv}',
                                         out_signature='')
         def PushOOB(self, fields):
-                print 'PushOOB'
+                print('PushOOB')
                 print_fields(fields)
 
         @dbus.service.method('org.neard.HandoverAgent',
@@ -57,15 +57,15 @@ class BTHOAgent(dbus.service.Object):
                                         out_signature='a{sv}')
 
         def RequestOOB(self, fields):
-                print 'RequestOOB'
+                print('RequestOOB')
                 print_fields(fields)
 
-                print '  Replying with'
+                print('  Replying with')
                 s = ' '.join('{:#02x}'.format(i) for i in eir_test_data)
-                print '    EIR: %s' % s
+                print('    EIR: %s' % s)
 
                 if power_state != 'unknown':
-                        print '    State: %s' % power_state
+                        print('    State: %s' % power_state)
                         return {'EIR' : eir_test_data, 'State' : power_state}
                 else:
                         return {'EIR' : eir_test_data}
@@ -76,14 +76,14 @@ class WiFiHOAgent(dbus.service.Object):
                                         in_signature='',
                                         out_signature='')
         def Release(self):
-                print 'Release'
+                print('Release')
                 mainloop.quit()
 
         @dbus.service.method('org.neard.HandoverAgent',
                                         in_signature='a{sv}',
                                         out_signature='')
         def PushOOB(self, fields):
-                print 'PushOOB'
+                print('PushOOB')
                 print_fields(fields)
 
         @dbus.service.method('org.neard.HandoverAgent',
@@ -91,15 +91,15 @@ class WiFiHOAgent(dbus.service.Object):
                                         out_signature='a{sv}')
 
         def RequestOOB(self, fields):
-                print 'RequestOOB'
+                print('RequestOOB')
                 print_fields(fields)
 
-                print '  Replying with'
+                print('  Replying with')
                 s = ' '.join('{:#02x}'.format(i) for i in wsc_test_data)
-                print '    WSC: %s' % s
+                print('    WSC: %s' % s)
 
                 if power_state != 'unknown':
-                        print '    State: %s' % power_state
+                        print('    State: %s' % power_state)
                         return {'WSC' : wsc_test_data, 'State' : power_state}
                 else:
                         return {'WSC' : wsc_test_data}
diff --git a/test/monitor-near b/test/monitor-near
index 49aa6db23f3f..d6cd24f9f64f 100755
--- a/test/monitor-near
+++ b/test/monitor-near
@@ -1,6 +1,4 @@
-#!/usr/bin/python
-
-from __future__ import absolute_import, print_function, unicode_literals
+#!/usr/bin/python3
 
 import gobject
 
@@ -9,15 +7,15 @@ import dbus.mainloop.glib
 
 def property_changed(interface, changed, invalidated, path):
         iface = interface[interface.rfind(".") + 1:]
-        for name, value in changed.iteritems():
+        for name, value in changed.items():
                 val = str(value)
                 print("{%s.PropertyChanged} [%s] %s = %s" % (iface, path, name,
                                                                         val))
 
 def interfaces_added(path, interfaces):
-        for iface, props in interfaces.iteritems():
+        for iface, props in interfaces.items():
                 print("{Added %s} [%s]" % (iface, path))
-                for name, value in props.iteritems():
+                for name, value in props.items():
                         print("      %s = %s" % (name, value))
 
 def interfaces_removed(path, interfaces):
diff --git a/test/ndef-agent b/test/ndef-agent
index bb25ab17edf2..72fcecf9d3a1 100755
--- a/test/ndef-agent
+++ b/test/ndef-agent
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 
 import gobject
 
@@ -12,43 +12,43 @@ class NDEFAgent(dbus.service.Object):
         @dbus.service.method("org.neard.NDEFAgent",
                                         in_signature='', out_signature='')
         def Release(self):
-                print "Release"
+                print("Release")
                 mainloop.quit()
 
         @dbus.service.method("org.neard.NDEFAgent",
                                         in_signature='a{sv}',
                                         out_signature='')
         def GetNDEF(self, fields):
-                print "GetNDEF"
+                print("GetNDEF")
 
                 if fields.has_key("Record"):
-                        print "Record path %s" % (fields["Record"])
+                        print("Record path %s" % (fields["Record"]))
 
                 if fields.has_key("Payload"):
                         val = "["
                         for i in fields["Payload"]:
                                 val += " 0x%x" % i
                         val += " ]"
-                        print "Record payload %s" % val
+                        print("Record payload %s" % val)
 
                 if fields.has_key("NDEF"):
                         val = "["
                         for i in fields["NDEF"]:
                                 val += " 0x%x" % i
                         val += " ]"
-                        print "Complete NDEF %s" % val
+                        print("Complete NDEF %s" % val)
 
                 return
 
         @dbus.service.method("org.neard.NDEFAgent",
                                         in_signature='', out_signature='')
         def Cancel(self):
-                print "Cancel"
+                print("Cancel")
 
 def print_usage():
-        print "Usage:"
-        print "%s Type=<record type>" % (sys.argv[0])
-        print "Help: %s help" % (sys.argv[0])
+        print("Usage:")
+        print("%s Type=<record type>" % (sys.argv[0]))
+        print("Help: %s help" % (sys.argv[0]))
         sys.exit(1)
 
 if __name__ == '__main__':
diff --git a/test/neard-ui.py b/test/neard-ui.py
index cf4bb13c5155..e960891eccf0 100755
--- a/test/neard-ui.py
+++ b/test/neard-ui.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 import pdb
 import sys
@@ -18,12 +18,12 @@ import neardutils
 class Neard:
 
     def interface_Added(self, path, interface):
-        print (" New interface added: %s") % path
+        print(" New interface added: %s" % path)
         self.objects = neardutils.get_managed_objects()
         self.interface_updateDetails(interface, path)
 
     def interface_Removed(self, path, interface):
-        print (" Remove interface: %s") % path
+        print(" Remove interface: %s" % path)
         self.objects = neardutils.get_managed_objects()
         self.interface_updateDetails(interface)
 
@@ -32,7 +32,7 @@ class Neard:
     #add/remove interface
     def interfaces_Connect(self):
         try:
-            print 'interfaces_Connect'
+            print('interfaces_Connect')
             bus = dbus.SystemBus()
             self.objects = neardutils.get_managed_objects()
             bus.add_signal_receiver(self.interface_Added, bus_name=neardutils.SERVICE_NAME,
@@ -42,7 +42,7 @@ class Neard:
                                     dbus_interface="org.freedesktop.DBus.ObjectManager",
                                     signal_name="InterfacesRemoved")
         except:
-            print ("Can't connect to org.freedesktop.DBus.ObjectManager");
+            print("Can't connect to org.freedesktop.DBus.ObjectManager");
             self.objects = None
 
         #Retrieve the manager informations
@@ -60,7 +60,7 @@ class Neard:
             self.record_updateDetails(path)
 
     def adapter_PropertyChanged(self, prop, value, adapt_path = None):
-        print("Prop changed: %s") % prop
+        print("Prop changed: %s" % prop)
         adapt_properties = {}
         adapt_properties[prop] = value
         if prop == "Tags":
@@ -71,7 +71,7 @@ class Neard:
     #Update the records UI
     def record_updateDetails(self, tag_path=None):
         if tag_path is not None:
-            for record_path, record_iface in self.objects.iteritems():
+            for record_path, record_iface in self.objects.items():
 
                 if neardutils.RECORD_INTERFACE not in record_iface:
                     continue
@@ -88,11 +88,11 @@ class Neard:
     #Update the tags UI
     def tag_updateDetails(self, adapter_path=None):
         if adapter_path is not None:
-            for tag_path, interfaces in self.objects.iteritems():
+            for tag_path, interfaces in self.objects.items():
                 if neardutils.TAG_INTERFACE not in interfaces:
                     continue
 
-                print ("TAG %s ") % tag_path
+                print("TAG %s " % tag_path)
 
                 tag_properties = interfaces[neardutils.TAG_INTERFACE]
 
@@ -102,19 +102,19 @@ class Neard:
                 #Process the records
                 self.record_updateDetails(tag_properties)
         else:
-            print ("remove tags and records")
+            print("remove tags and records")
             self.tags_update()
             self.records_update()
 
 
     #Something changed, must update the UI
     def adapter_updateDetails(self):
-        for adapt_path, interfaces in self.objects.iteritems():
+        for adapt_path, interfaces in self.objects.items():
             if neardutils.ADAPTER_INTERFACE not in interfaces:
                    continue
 
             if adapt_path in self.adaptregistered:
-                   print (" already registered %s") % adapt_path
+                   print(" already registered %s" % adapt_path)
             else:
                    adapt_properties = interfaces[neardutils.ADAPTER_INTERFACE]
 
@@ -179,16 +179,16 @@ class NeardUI(Neard):
 
             try:
                 if self.adapters_actionToggle(i, 2):
-                    print ("Disable Adapter %s") % objpath
+                    print("Disable Adapter %s" % objpath)
                     adapter.Set(neardutils.ADAPTER_INTERFACE, "Powered", False)
                     self.adapters_list.set_value(i, 2, 0)
                 else:
-                    print ("Enable Adapter %s") % objpath
+                    print("Enable Adapter %s" % objpath)
                     adapter.Set(neardutils.ADAPTER_INTERFACE, "Powered", True)
                     self.adapters_list.set_value(i, 2, 1)
 
             except:
-                print ("Can't toggle adapter %s") % objpath
+                print("Can't toggle adapter %s" % objpath)
 
     # Action: activate or not the polling mode
     def adapter_pollingToggled(self, poolingRendererToggle, path, user):
@@ -199,15 +199,15 @@ class NeardUI(Neard):
 
             try:
                 if self.adapters_actionToggle(i, 3):
-                    print ("Stop Polling %s") % objpath
+                    print("Stop Polling %s" % objpath)
                     adapt_iface.StopPollLoop()
                     self.adapters_list.set_value(i, 3, 0)
                 else:
-                    print ("Start Polling %s") % objpath
+                    print("Start Polling %s" % objpath)
                     adapt_iface.StartPollLoop("Initiator")
                     self.adapters_list.set_value(i, 3, 1)
             except:
-                print ("Can't toggle polling on adapter %s") % objpath
+                print("Can't toggle polling on adapter %s" % objpath)
 
     #------------------------------
     #Set the field values
@@ -238,7 +238,7 @@ class NeardUI(Neard):
 
             if value is not None:
                 self.adapters_list.set_value(i, col, value)
-            print ("  property %s, value %s") % (name, value)
+            print("  property %s, value %s" % (name, value))
 
     # Clear one or all the adapters present in list
     def adapter_RemoveUI(self):
@@ -254,18 +254,18 @@ class NeardUI(Neard):
 
         if adapt_properties is None:
             if i:
-                print ("Delete adapter %s") % path
+                print("Delete adapter %s" % path)
                 self.adapters_list.remove(i)
             else:
-                print ("Already deleted adapter %s") % path
+                print("Already deleted adapter %s" % path)
             return
 
         if i is None:
             i = self.adapters_list.append()
             self.adapters_list.set_value(i, 0, path)
-            print ("Add adapter %s") % (path)
+            print("Add adapter %s" % (path))
         else:
-            print ("Update adapter %s") % (path)
+            print("Update adapter %s" % (path))
 
 
         self.adapters_setUIList(adapt_properties, i, 2, "Powered")
@@ -289,11 +289,11 @@ class NeardUI(Neard):
 
             if value is not None:
                 self.tags_list.set_value(i, col, value)
-            print ("  property %s, value %s") % (name, value)
+            print("  property %s, value %s" % (name, value))
 
     #Add, Update or delete a list entry
     def tag_UpdateUI(self, path = None, tag_properties = None):
-        print("Tag Update %s") % path
+        print("Tag Update %s" % path)
         i = self.tags_list.get_iter_first()
         while i is not None:
             if self.tags_list.get_value(i, 0) == path:
@@ -305,7 +305,7 @@ class NeardUI(Neard):
             i = self.tags_list.get_iter_first()
             while i is not None:
                 path_name = self.tags_list.get_value(i, 0)
-                print ("Deleted tag %s") % path_name
+                print("Deleted tag %s" % path_name)
                 self.tags_list.remove(i)
                 if self.tags_list.iter_is_valid(i):
                     i = self.tags_list.iter_next(i)
@@ -316,9 +316,9 @@ class NeardUI(Neard):
         if i is None:
             i = self.tags_list.append()
             self.tags_list.set_value(i, 0, path)
-            print ("Add tag %s") % (path)
+            print("Add tag %s" % (path))
         else:
-            print ("Update tag %s") % (path)
+            print("Update tag %s" % (path))
         self.tags_setUIList(tag_properties, i, 2, "ReadOnly")
         self.tags_setUIList(tag_properties, i, 3, "Type")
 
@@ -336,11 +336,11 @@ class NeardUI(Neard):
 
         if value is not None:
             self.records_list.set_value(i, col, value)
-        print ("  property %s, value %s") % (name, value)
+        print("  property %s, value %s" % (name, value))
 
     #Add, Update or delete a list entry
     def record_UpdateUI(self, path = None, record_properties = None):
-        print("Record Update %s") % path
+        print("Record Update %s" % path)
         i = self.records_list.get_iter_first()
         while i is not None:
             if self.records_list.get_value(i, 0) == path:
@@ -352,7 +352,7 @@ class NeardUI(Neard):
             i = self.records_list.get_iter_first()
             while i is not None:
                 path_name = self.records_list.get_value(i, 0)
-                print ("Delete record %s") % path_name
+                print("Delete record %s" % path_name)
                 self.records_list.remove(i)
                 if self.records_list.iter_is_valid(i):
                     i = self.records_list.iter_next(i)
@@ -363,9 +363,9 @@ class NeardUI(Neard):
         if i is None:
             i = self.records_list.append()
             self.records_list.set_value(i, 0, path)
-            print ("Add record %s") % (path)
+            print("Add record %s" % (path))
         else:
-            print ("Update record %s") % (path)
+            print("Update record %s" % (path))
 
         self.records_setUIList(record_properties, i, 2, "Type")
         self.records_setUIList(record_properties, i, 3, "Data")
@@ -379,9 +379,9 @@ class NeardUI(Neard):
         model, iter = selection.get_selected()
         if iter:
              value = self.adapters_list.get_value(iter, 0)
-             print ("value %s") % value
+             print("value %s" % value)
              value = self.adapters_list.get_value(iter, 5)
-             print ("tag: %s") % value
+             print("tag: %s" % value)
 
 
     #-----------------------------------------------------
diff --git a/test/neardutils.py b/test/neardutils.py
index 6e423c075fe2..520870ab7944 100644
--- a/test/neardutils.py
+++ b/test/neardutils.py
@@ -17,7 +17,7 @@ def find_adapter(pattern=None):
 
 def find_adapter_in_objects(objects, pattern=None):
         bus = dbus.SystemBus()
-        for path, ifaces in objects.iteritems():
+        for path, ifaces in objects.items():
                 adapter = ifaces.get(ADAPTER_INTERFACE)
                 if adapter is None:
                         continue
@@ -31,7 +31,7 @@ def find_device(pattern=None):
 
 def find_device_in_objects(objects, pattern=None):
         bus = dbus.SystemBus()
-        for path, ifaces in objects.iteritems():
+        for path, ifaces in objects.items():
                 device = ifaces.get(DEVICE_INTERFACE)
                 if device is None:
                         continue
@@ -45,7 +45,7 @@ def find_tag(pattern=None):
 
 def find_tag_in_objects(objects, pattern=None):
         bus = dbus.SystemBus()
-        for path, ifaces in objects.iteritems():
+        for path, ifaces in objects.items():
                 tag = ifaces.get(TAG_INTERFACE)
                 if tag is None:
                         continue
@@ -59,7 +59,7 @@ def find_record(pattern=None):
 
 def find_record_in_objects(objects, pattern=None):
         bus = dbus.SystemBus()
-        for path, ifaces in objects.iteritems():
+        for path, ifaces in objects.items():
                 record = ifaces.get(RECORD_INTERFACE)
                 if record is None:
                         continue
@@ -76,18 +76,15 @@ def dump_record(record_path):
         properties = record_prop.GetAll(RECORD_INTERFACE)
 
         for key in properties.keys():
-                if key in ["Representation"]:
-                        val = unicode(properties[key])
-                else:
-                        val = str(properties[key])
-                print "      %s = %s" % (key, val)
+                val = str(properties[key])
+                print("      %s = %s" % (key, val))
 
 def dump_all_records(path):
         bus = dbus.SystemBus()
         om = dbus.Interface(bus.get_object(SERVICE_NAME, "/"),
                                         "org.freedesktop.DBus.ObjectManager")
         objects = om.GetManagedObjects()
-        for path, interfaces in objects.iteritems():
+        for path, interfaces in objects.items():
                 if RECORD_INTERFACE not in interfaces:
                         continue
 
diff --git a/test/phdc-simple-manager b/test/phdc-simple-manager
index e802c5a3252c..97dc8fd6090d 100755
--- a/test/phdc-simple-manager
+++ b/test/phdc-simple-manager
@@ -1,4 +1,4 @@
-#!/usr/bin/env python2.7
+#!/usr/bin/env python3
 
 import sys
 import dbus
@@ -46,8 +46,8 @@ def hexdump( chars, sep, width ):
                 line = chars[:width]
                 chars = chars[width:]
                 line = line.ljust( width, '\000' )
-                print "%s%s%s" % ( sep.join( "%02x" % ord(c) for c in line ),
-                         sep, quotechars( line ))
+                print("%s%s%s" % ( sep.join( "%02x" % ord(c) for c in line ),
+                         sep, quotechars( line )))
 
 
 def quotechars( chars ):
@@ -57,26 +57,26 @@ def quotechars( chars ):
 class PhdcPeerManager:
     def __init__(self, agent_fd):
         #Grab the agent ....
-        print 'Init PhdcPeerManager thread'
+        print('Init PhdcPeerManager thread')
         self.r_fd = agent_fd.take()
-        print 'Agent fd:', str(self.r_fd)
+        print('Agent fd:', str(self.r_fd))
 
     def run( self):
-        print 'Run PhdcPeerManager thread: ', str(self.r_fd)
+        print('Run PhdcPeerManager thread: ', str(self.r_fd))
         self.sock = socket.fromfd(self.r_fd, AF_NFC, socket.SOCK_STREAM)
         try:
             while True:
                 miu = self.sock.getsockopt(SOL_NFC, NFC_LLCP_MIUX)
-                print 'MIU=', miu
+                print('MIU=', miu)
 
                 while True:
                     data = self.sock.recv(16)
                     if data == None:
-                       print 'no data'
+                       print('no data')
                        break
 
                    #analyze frame
-                    print 'analyze'
+                    print('analyze')
                     size = struct.unpack(">H", data[0:2])[0]
                     apdu = data[2:]
 
@@ -86,7 +86,7 @@ class PhdcPeerManager:
                         if data == None: break
                         hexdump(data, ':', 16)
                         apdu += data
-                    print "[ieee] <<< {0}".format(str(apdu).encode("hex"))
+                    print("[ieee] <<< {0}".format(str(apdu).encode("hex")))
                     if apdu.startswith("\xE2\x00"):
                         apdu = bytearray.fromhex(thermometer_assoc_res)
                     elif apdu.startswith("\xE4\x00"):
@@ -94,26 +94,26 @@ class PhdcPeerManager:
                     else:
                         apdu = apdu[::-1]
                     time.sleep(0.2)
-                    print "[ieee] >>> {0}".format(str(apdu).encode("hex"))
+                    print("[ieee] >>> {0}".format(str(apdu).encode("hex")))
                     data = struct.pack(">H", len(apdu)) + apdu
                     for i in range(0, len(data), miu):
                         self.sock.send(str(data[i:i+miu]))
 
-                print "remote peer {0} closed connection".format(agent_fd)
-                print "leaving ieee manager"
+                print("remote peer {0} closed connection".format(agent_fd))
+                print("leaving ieee manager")
                 self.sock.close()
 
         except IOError as e:
                 if e.errno == errno.EPIPE:
-                        print 'Remote disconnect'
+                        print('Remote disconnect')
                 else:
-                        print "I/O error({0}): {1}".format(e.errno, e.strerror)
+                        print("I/O error({0}): {1}".format(e.errno, e.strerror))
         finally:
-                print 'Finally exit'
+                print('Finally exit')
                 stop()
 
         def stop(self):
-                print 'Stop PhdcPeerManager:', str(self.r_fd)
+                print('Stop PhdcPeerManager:', str(self.r_fd))
                 self._Thread__stop()
 
 #===================================================
@@ -125,7 +125,7 @@ class SimplePhdcManager(dbus.service.Object):
                                         in_signature='',
                                         out_signature='')
         def Release(self):
-                print 'Release'
+                print('Release')
                 mainloop.quit()
 
 
@@ -135,11 +135,11 @@ class SimplePhdcManager(dbus.service.Object):
                                         in_signature='h',
                                         out_signature='')
         def NewConnection(self, agent_fd):
-                print'Launch Phdc Manager thread for fd:', str(agent_fd)
+                print('Launch Phdc Manager thread for fd:', str(agent_fd))
                 self.server = PhdcPeerManager(agent_fd)
-                print'Run Server'
+                print('Run Server')
                 self.server.run()
-                print'Leave Server'
+                print('Leave Server')
                 return
 
         ''' Called when the agent ends (from phdc_close)
@@ -147,7 +147,7 @@ class SimplePhdcManager(dbus.service.Object):
         @dbus.service.method('org.neard.PHDC.Manager',
                                         in_signature='hi', out_signature='')
         def Disconnection(self,agent_fd, i_err):
-                print'Stop Phdc Manager thread'
+                print('Stop Phdc Manager thread')
                 self.server.stop()
                 return
 
@@ -159,7 +159,7 @@ This sample installs two PHDC Managers:
 if "__main__" == __name__:
         dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
 
-        print 'PHDC Simple Manager Test'
+        print('PHDC Simple Manager Test')
         bus = dbus.SystemBus()
         obj = bus.get_object("org.neard", "/org/neard");
         neard_manager = dbus.Interface(obj, "org.neard.PHDC")
@@ -167,14 +167,14 @@ if "__main__" == __name__:
         simple_path = '/Simple'
         valid_path = '/Validation'
 
-        print 'Creating & registering PHDC Simple Manager'
+        print('Creating & registering PHDC Simple Manager')
         simpleobject = SimplePhdcManager(bus, simple_path)
 
         d = dbus.Dictionary({'Role': 'Manager', 'Path': simple_path,
                         'ServiceName': 'urn:nfc:sn:phdc' }, signature='sv')
         neard_manager.RegisterAgent(d)
 
-        print 'Creating & Registering Validation Manager'
+        print('Creating & Registering Validation Manager')
 
         validationobj= SimplePhdcManager(bus, valid_path)
         d = dbus.Dictionary({'Role': 'Manager', 'Path': valid_path,
diff --git a/test/test-adapter b/test/test-adapter
index 93b6f96e33ca..6d22f59bda0f 100755
--- a/test/test-adapter
+++ b/test/test-adapter
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 
 import sys
 import dbus
@@ -27,7 +27,7 @@ if (len(sys.argv) < 2):
 if (sys.argv[1] == "list"):
         if (len(sys.argv) < 3):
                 objects = neardutils.get_managed_objects()
-                for path, interfaces in objects.iteritems():
+                for path, interfaces in objects.items():
                         if "org.neard.Adapter" not in interfaces:
                                 continue
 
@@ -70,8 +70,8 @@ if (sys.argv[1] == "powered"):
                         value = dbus.Boolean(sys.argv[3])
                 try:
                         adapter.Set("org.neard.Adapter", "Powered", value)
-                except dbus.DBusException, error:
-                        print "%s: %s" % (error._dbus_error_name, error.message)
+                except dbus.DBusException as error:
+                        print("%s: %s" % (error._dbus_error_name, error.message))
         sys.exit(0)
 
 if (sys.argv[1] == "poll"):
@@ -90,14 +90,14 @@ if (sys.argv[1] == "poll"):
 
                         try:
                                 adapter.StartPollLoop(mode)
-                        except dbus.DBusException, error:
-                                print "%s: %s" % (error._dbus_error_name, error.message)
+                        except dbus.DBusException as error:
+                                print("%s: %s" % (error._dbus_error_name, error.message))
 
                 elif (sys.argv[3] == "off"):
                         try:
                                 adapter.StopPollLoop()
-                        except dbus.DBusException, error:
-                                print "%s: %s" % (error._dbus_error_name, error.message)
+                        except dbus.DBusException as error:
+                                print("%s: %s" % (error._dbus_error_name, error.message))
 
                 else:
                         usage()
diff --git a/test/test-device b/test/test-device
index bc66ce3f01cd..3086e1aad915 100755
--- a/test/test-device
+++ b/test/test-device
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 
 import sys
 import dbus
@@ -19,20 +19,20 @@ def usage():
         print("  list")
         print("  dump <device>")
         print("  push <device> <type> <...>")
-        print "    If type is Text, parameters are <encoding> <language> <representation>"
-        print "    If type is URI, parameters are <uri>"
-        print "    If type is SmartPoster, parameters are <uri>"
-        print "    If type is Handover, parameters are <carrier>"
-        print "    If type is StaticHandover, parameters are <carrier>"
-        print "    If type is MIME, parameters are <mime_type> (only wifi_wsc and raw)"
-        print "       raw is for sending raw payload, parameters are <mime_type> <payload>"
-        print "e.g. < %s push /org/neard/nfc0/device0 Text UTF-8 en-US hello,Type2! >" % (sys.argv[0])
-        print "e.g. < %s push /org/neard/nfc0/device0 URI http://www.nfc-forum.com >" % (sys.argv[0])
-        print "e.g. < %s push /org/neard/nfc0/device0 SmartPoster http://www.nfc-forum.com >" % (sys.argv[0])
-        print "e.g. < %s push /org/neard/nfc0/device0 Handover bluetooth,wifi >" % (sys.argv[0])
-        print "e.g. < %s push /org/neard/nfc0/device0 StaticHandover bluetooth,wifi >" % (sys.argv[0])
-        print "e.g. < %s push /org/neard/nfc0/device0 MIME wifi_wsc>" % (sys.argv[0])
-        print "e.g. < %s push /org/neard/nfc0/device0 MIME raw application/xml '<your><xml tags></your>' >" % (sys.argv[0])
+        print("    If type is Text, parameters are <encoding> <language> <representation>")
+        print("    If type is URI, parameters are <uri>")
+        print("    If type is SmartPoster, parameters are <uri>")
+        print("    If type is Handover, parameters are <carrier>")
+        print("    If type is StaticHandover, parameters are <carrier>")
+        print("    If type is MIME, parameters are <mime_type> (only wifi_wsc and raw)")
+        print("       raw is for sending raw payload, parameters are <mime_type> <payload>")
+        print("e.g. < %s push /org/neard/nfc0/device0 Text UTF-8 en-US hello,Type2! >" % (sys.argv[0]))
+        print("e.g. < %s push /org/neard/nfc0/device0 URI http://www.nfc-forum.com >" % (sys.argv[0]))
+        print("e.g. < %s push /org/neard/nfc0/device0 SmartPoster http://www.nfc-forum.com >" % (sys.argv[0]))
+        print("e.g. < %s push /org/neard/nfc0/device0 Handover bluetooth,wifi >" % (sys.argv[0]))
+        print("e.g. < %s push /org/neard/nfc0/device0 StaticHandover bluetooth,wifi >" % (sys.argv[0]))
+        print("e.g. < %s push /org/neard/nfc0/device0 MIME wifi_wsc>" % (sys.argv[0]))
+        print("e.g. < %s push /org/neard/nfc0/device0 MIME raw application/xml '<your><xml tags></your>' >" % (sys.argv[0]))
 
         sys.exit(1)
 
@@ -42,7 +42,7 @@ if (len(sys.argv) < 2):
 if (sys.argv[1] == "list"):
         if (len(sys.argv) < 3):
                 objects = neardutils.get_managed_objects()
-                for path, interfaces in objects.iteritems():
+                for path, interfaces in objects.items():
                         if "org.neard.Device" not in interfaces:
                                 continue
 
@@ -58,7 +58,7 @@ if (sys.argv[1] == "list"):
 if (sys.argv[1] == "dump"):
         if (len(sys.argv) < 3):
                 objects = neardutils.get_managed_objects()
-                for path, interfaces in objects.iteritems():
+                for path, interfaces in objects.items():
                         if "org.neard.Device" not in interfaces:
                                 continue
 
diff --git a/test/test-tag b/test/test-tag
index 9f7f58851cc9..4183b9c3ded8 100755
--- a/test/test-tag
+++ b/test/test-tag
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 
 import sys
 import dbus
@@ -46,7 +46,7 @@ if (len(sys.argv) < 2):
 if (sys.argv[1] == "list"):
         if (len(sys.argv) < 3):
                 objects = neardutils.get_managed_objects()
-                for path, interfaces in objects.iteritems():
+                for path, interfaces in objects.items():
                         if "org.neard.Tag" not in interfaces:
                                 continue
 
@@ -70,7 +70,7 @@ if (sys.argv[1] == "list"):
 if (sys.argv[1] == "dump"):
         if (len(sys.argv) < 3):
                 objects = neardutils.get_managed_objects()
-                for path, interfaces in objects.iteritems():
+                for path, interfaces in objects.items():
                         if "org.neard.Tag" not in interfaces:
                                 continue
 
@@ -127,7 +127,7 @@ def write_uri(args):
                 data["Type"] = "URI"
                 data["URI"] = args[0]
 
-        print data
+        print(data)
 
         tag.Write(data)
 
@@ -169,7 +169,7 @@ if (sys.argv[1] == "write"):
         sys.exit(0)
 
 if (sys.argv[1] == "deactivate"):
-        print sys.argv[2]
+        print(sys.argv[2])
         if (len(sys.argv) != 2):
                 tag = neardutils.find_tag(sys.argv[2])
                 tag.Deactivate()
-- 
2.33.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
