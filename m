Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B3A460E4E
	for <lists+linux-nfc@lfdr.de>; Mon, 29 Nov 2021 06:06:42 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AADBB100EA2C1;
	Sun, 28 Nov 2021 21:06:35 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6BDE3100EA2CA
	for <linux-nfc@lists.01.org>; Sun, 28 Nov 2021 21:06:33 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id CE5CE32009BC;
	Mon, 29 Nov 2021 00:06:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 29 Nov 2021 00:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=1D8PCQ2KFpj+0
	lwUH+RKPvNvCZd9L+1SA53Z2cmkVE0=; b=QARbEzOo8PbaVC5wlwBjzzJKE7sgR
	aFNtSvKxioKAluzYsXB3DU5eNDIHx+3LxS0YO1XfAs3SXf3KlQTJc/ZIYMd4prDz
	evoJ8Xg4Z/57opJuS31qdqZXuUKJLHnUjbT1xdKr4G8AGkk2Vt5CRwqYl6tcueob
	ezkhbV7vaykr8VW5MEHlehMh7CQXFOsrjZfh9d4Yja7WGepjdGkf2O59uaU9fKdC
	sIkgSpWEyXPqV9FMIfsGrSlCpCXRiPum452ADeKecawh3oLLkTNqV2Pb6H5dv8Cg
	MLTPdsPL2MH4qBY9y+kaiig2RjTt8SSLzqqW8D//rQoCmgQTv6UNLRkIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=1D8PCQ2KFpj+0lwUH+RKPvNvCZd9L+1SA53Z2cmkVE0=; b=LAwGYhJe
	yjVewsgbDqoxC4iJO69JLPGFXbiH1NPzhog+Zj/gqYqsI7iTOQV3q280VDocogSs
	4p//RFCwJAgbd4bkGwYCLiSAT1dyGCbFoJfbFYFlgPPpsB4J3AUPwsenrewY+KGh
	PrlRoIP7FXuduCDWAkDhU/op5UR4zlKlZwFbFmcKdQAopg/92B7apjLgJvw4mjtB
	51UGD8npn0hRWrNpeZzcob9EjR82bIaIDDyuY3zVVvfwFYfTWLBlRmQj3e6In37C
	Jh3yIAfItuPdtEiuGsgNM7POlzZ8RWpeO30FGwNlCyppv9VGbgT2ebGsOWYSngVl
	vc8zQvi3I3+XtQ==
X-ME-Sender: <xms:2F-kYcyZViPDPtYrPTndPqKwV5AQXgaThrBBLzSjwFws0FqUab1atg>
    <xme:2F-kYQTgEtIaEx1JRFuzix5yPYR1mo9vkqah8mAknSqi2mtZJrcUXvc0kVCUOVLNy
    Z4t201gHDxxG7jkNQ>
X-ME-Received: <xmr:2F-kYeVRXVo4wDOjX5d67X_JNVa2PZWdIwilli4vjEEXfm-e6LqG7BhDF14V4t6hN9yPPJtF1FV_UuinuVF49bOB4gMWXmNVJj0GTrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfi
    rhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtffrrg
    htthgvrhhnpeeujefgjeduheduudehgeefuddvueffkeeigfdtteeuieeivdfgieefhfff
    vdevhfenucffohhmrghinhepnhgvrghrugdrshgvnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghk
    rdgtohhm
X-ME-Proxy: <xmx:2F-kYagIT6tAPIzANgifV3MZ8CHolRV0QvsKbA9yxRwdcx5_boDIqQ>
    <xmx:2F-kYeBjkdnfJ7pFFJ-fscBMgEL1k1yH0XFZUb4BC6NhpOi9UaN2IQ>
    <xmx:2F-kYbJiCRbQEDBHHdaL6LsFqR6yi9QxjS4V393EQPDcp4QQLAp9Mw>
    <xmx:2F-kYf6AL99T5rrpOqgP0F8skb1kpUywbNNvyAdzcx8cniXuoFFmJw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 00:06:31 -0500 (EST)
Received: from blue.animalcreek.com (localhost [127.0.0.1])
	by blue.animalcreek.com (Postfix) with ESMTP id 43CD613604AC;
	Sun, 28 Nov 2021 22:06:29 -0700 (MST)
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Date: Sun, 28 Nov 2021 22:06:05 -0700
Message-Id: <20211129050606.873494-6-mgreer@animalcreek.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211129050606.873494-1-mgreer@animalcreek.com>
References: <20211129050606.873494-1-mgreer@animalcreek.com>
MIME-Version: 1.0
Message-ID-Hash: YXG6TSKEEWT3BHAI7LIO6TCASDWOMIFZ
X-Message-ID-Hash: YXG6TSKEEWT3BHAI7LIO6TCASDWOMIFZ
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 5/6] se: Convert SE test script from Python2 to Python3
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YXG6TSKEEWT3BHAI7LIO6TCASDWOMIFZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Python2 is deprecated so convert the SE test scripts, which are
Python2, to Python3.

Signed-off-by: Mark Greer <mgreer@animalcreek.com>
---
 se/test/test-channel | 18 +++++++++---------
 se/test/test-seel    | 38 +++++++++++++++++++-------------------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/se/test/test-channel b/se/test/test-channel
index 5fa9b7e7fc41..52af1b38e937 100755
--- a/se/test/test-channel
+++ b/se/test/test-channel
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 
 import sys
 import dbus
@@ -9,10 +9,10 @@ def extract_byte_array(byte_array):
         return ' '.join("{:02x}".format(byte) for byte in byte_array)
 
 def usage():
-        print "Usage: %s <command>" % (sys.argv[0])
-        print ""
-        print "  list"
-        print "  send_apdu se/nfcX_<se_type>_seX channelX <apdu>"
+        print("Usage: %s <command>" % (sys.argv[0]))
+        print("")
+        print("  list")
+        print("  send_apdu se/nfcX_<se_type>_seX channelX <apdu>")
         sys.exit(1)
 
 if (len(sys.argv) < 2):
@@ -29,7 +29,7 @@ if (sys.argv[1] == "list"):
                 properties = seel.GetProperties()
 
                 for path in properties["Channels"]:
-                        print "[ %s ]" % (path)
+                        print("[ %s ]" % (path))
 
                         channel = dbus.Interface(bus.get_object("org.neard.se", path),
                                                 "org.neard.se.Channel")
@@ -41,10 +41,10 @@ if (sys.argv[1] == "list"):
                                                 val = "true"
                                         else:
                                                 val = "false"
-                                        print "    %s = %s" % (key, val)
+                                        print("    %s = %s" % (key, val))
 
                                 if key in ["AID"]:
-                                        print "    %s = %s" % (key, extract_byte_array(properties[key]))
+                                        print("    %s = %s" % (key, extract_byte_array(properties[key])))
         sys.exit(0)
 
 if (sys.argv[1] == "send_apdu"):
@@ -58,7 +58,7 @@ if (sys.argv[1] == "send_apdu"):
 
                 response = channel.SendAPDU(sys.argv[4].decode("hex"))
 
-                print "--> %s" % extract_byte_array(response)
+                print("--> %s" % extract_byte_array(response))
         sys.exit(0)
 
 usage()
diff --git a/se/test/test-seel b/se/test/test-seel
index 16c797dbc6fc..f3df3e7a7b95 100755
--- a/se/test/test-seel
+++ b/se/test/test-seel
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python3
 
 import sys
 import dbus
@@ -13,12 +13,12 @@ def extract_list(list):
         return val
 
 def usage():
-        print "Usage: %s <command>" % (sys.argv[0])
-        print ""
-        print "  list"
-        print "  enabled se/nfcX_<se_type>_seX [on/off]"
-        print "  open_channel se/nfcX_<se_type>_seX <AID>"
-        print "  close_channel se/nfcX_<se_type>_seX channelX"
+        print("Usage: %s <command>" % (sys.argv[0]))
+        print("")
+        print("  list")
+        print("  enabled se/nfcX_<se_type>_seX [on/off]")
+        print("  open_channel se/nfcX_<se_type>_seX <AID>")
+        print("  close_channel se/nfcX_<se_type>_seX channelX")
         sys.exit(1)
 
 if (len(sys.argv) < 2):
@@ -33,7 +33,7 @@ if (sys.argv[1] == "list"):
                 properties = manager.GetProperties()
 
                 for path in properties["SecureElements"]:
-                        print "[ %s ]" % (path)
+                        print("[ %s ]" % (path))
 
                         seel = dbus.Interface(bus.get_object("org.neard.se", path),
                                                 "org.neard.se.SecureElement")
@@ -45,13 +45,13 @@ if (sys.argv[1] == "list"):
                                                 val = "true"
                                         else:
                                                 val = "false"
-                                        print "    %s = %s" % (key, val)
+                                        print("    %s = %s" % (key, val))
 
                                 if key in ["Type"]:
-                                        print "    %s = %s" % (key, str(properties[key]))
+                                        print("    %s = %s" % (key, str(properties[key])))
 
                                 if key in ["Channels"]:
-                                        print "    %s = %s" % (key, extract_list(properties[key]))
+                                        print("    %s = %s" % (key, extract_list(properties[key])))
         sys.exit(0)
 
 if (sys.argv[1] == "enabled"):
@@ -69,10 +69,10 @@ if (sys.argv[1] == "enabled"):
                         elif (sys.argv[3] == "off"):
                                 val = seel.SetProperty("Enabled", dbus.Boolean(0), timeout = 10)
                         else:
-                                print "Invalid option %s" % sys.argv[3]
+                                print("Invalid option %s" % sys.argv[3])
 
-                except dbus.DBusException, error:
-                        print "%s: %s" % (error._dbus_error_name, error.message)
+                except dbus.DBusException as error:
+                        print("%s: %s" % (error._dbus_error_name, error.message))
         sys.exit(0)
 
 if (sys.argv[1] == "open_channel"):
@@ -87,9 +87,9 @@ if (sys.argv[1] == "open_channel"):
                 try:
                         channel = seel.OpenChannel(sys.argv[3].decode("hex"))
 
-                        print "Opened channel: %s" % str(channel)
-                except dbus.DBusException, error:
-                        print "%s: %s" % (error._dbus_error_name, error.message)
+                        print("Opened channel: %s" % str(channel))
+                except dbus.DBusException as error:
+                        print("%s: %s" % (error._dbus_error_name, error.message))
         sys.exit(0)
 
 if (sys.argv[1] == "close_channel"):
@@ -107,8 +107,8 @@ if (sys.argv[1] == "close_channel"):
                 try:
                         seel.CloseChannel(channel)
 
-                except dbus.DBusException, error:
-                        print "%s: %s" % (error._dbus_error_name, error.message)
+                except dbus.DBusException as error:
+                        print("%s: %s" % (error._dbus_error_name, error.message))
         sys.exit(0)
 
 usage()
-- 
2.33.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
