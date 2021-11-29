Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA85460E4F
	for <lists+linux-nfc@lfdr.de>; Mon, 29 Nov 2021 06:06:43 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B7657100EA2DB;
	Sun, 28 Nov 2021 21:06:36 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 86688100EA2CA
	for <linux-nfc@lists.01.org>; Sun, 28 Nov 2021 21:06:33 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id E304A3200AF0;
	Mon, 29 Nov 2021 00:06:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 29 Nov 2021 00:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=CY/Q4RT+nXeL1
	0ZQEonBFzdTVKICIlFFNDU5GIsZEsE=; b=QApxU7fxTLqM3lrn3Un+BM+NtWT87
	tWvSbLOY+o7yBoFbpznavlnaPSoPhZvEkyru4i9/2N3YBoewD7wp7DaFOCBWAkl1
	n96Ily9L3jQ4LALDZmtdxvfFh6a8KOxquCCPWxND725lqrK1IPsWxyVdScK2wgEg
	lRjm809ni/Wl10ox+ge/q/+A4bsUlPFxiVSYXZSAFrgXtyMpgnKIETLKhUjEtxsu
	XUJUiMf2MiJ973r3RvTiKZbApp+GzO3+CrjV9zGys+jrgRV+5YZ1kYUTsc0Oac3W
	fvLKMv5BENR+CyaRpyqWhE+WHm809R8kKY9Hkd39Zk6cNV6ug9/iETIGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=CY/Q4RT+nXeL10ZQEonBFzdTVKICIlFFNDU5GIsZEsE=; b=Zi/0Q77t
	K/6uN8XifzgoKP6EI6An7B3NtR8tTHrGGlHYowQYLHbkTsgc6aAZUgwqMi8oBk0J
	2wsfkgJ9PMkm1pjqXWCwB97C7O+MpOzgIhbfUL6kOs9M+pnmJMB+pfjq/NDo9C0f
	8HdQrHo2xv6g6TWS3bIctDLiVlfgz/R5/6G4HcoQOLPiH2TqfmrZPPKtocauIkFS
	byL3JWJiV4iSP9N6gZbObWqNXeEAb1WCCCbRirTu7TrYSyMiEiwNBo/sanl9kIns
	oA8VdiuOOyMvrpHOKIPTqRLnYMtbQVTypXesmMxvSeHiSjR4Z8xZewzXZAlvXY9c
	m2pjm4je2xf57w==
X-ME-Sender: <xms:2F-kYSodJ1aNIdg9TxmcXPrnwQnJe3Ti8uWyOj65vSPx2BJfKxzYLA>
    <xme:2F-kYQpDiWlOjQe_fbqj_oY6kBDTC7ptOlue2mS_Q9nEWwqtee-Zx8ePkM6wwp3DV
    a1ikd2lhulEeXilUA>
X-ME-Received: <xmr:2F-kYXPfRLKZ83g-Lm09num85SYQfjHxg2OdP7GXPpNiPkiwcLbkNJwyJM1UKyGFp-0-PtmEPb3f8P4ChvVdv9N7UoWPH1o1Hao6SP4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfi
    rhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtffrrg
    htthgvrhhnpeeujefgjeduheduudehgeefuddvueffkeeigfdtteeuieeivdfgieefhfff
    vdevhfenucffohhmrghinhepnhgvrghrugdrshgvnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghk
    rdgtohhm
X-ME-Proxy: <xmx:2F-kYR7i-8TZXM1cLMoIlYBjvduXB0dUrHYFNIaECXvlo8CLdEkq7g>
    <xmx:2F-kYR7_UeAohY2Czg5pSSXDhuU0gjkeUWGOwrZoTw-JxQBhnQz7iA>
    <xmx:2F-kYRgwreLaEjY-6lw5gw-q3cvYZNy0FS_prsSMdAc9QPAmN6aMRA>
    <xmx:2F-kYTTTlUGb0v_Dh61YVUKz16n34gm8veVEO--SN0xjofoJbJXSlg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 00:06:31 -0500 (EST)
Received: from blue.animalcreek.com (localhost [127.0.0.1])
	by blue.animalcreek.com (Postfix) with ESMTP id 521C413604AD;
	Sun, 28 Nov 2021 22:06:29 -0700 (MST)
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Date: Sun, 28 Nov 2021 22:06:06 -0700
Message-Id: <20211129050606.873494-7-mgreer@animalcreek.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211129050606.873494-1-mgreer@animalcreek.com>
References: <20211129050606.873494-1-mgreer@animalcreek.com>
MIME-Version: 1.0
Message-ID-Hash: OBHNL2AFLL7EBF6DPOOFFOGA4RY2IZT3
X-Message-ID-Hash: OBHNL2AFLL7EBF6DPOOFFOGA4RY2IZT3
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 6/6] se: Reformat SE Python test scripts
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OBHNL2AFLL7EBF6DPOOFFOGA4RY2IZT3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reformat the Python-based SE test scripts using the "Prettier"
beautifiers (default options).  This brings the code closer to
conformance with the PEP 8 style guide.

Signed-off-by: Mark Greer <mgreer@animalcreek.com>
---
 se/test/test-channel |  98 ++++++++++----------
 se/test/test-seel    | 209 ++++++++++++++++++++++---------------------
 2 files changed, 161 insertions(+), 146 deletions(-)

diff --git a/se/test/test-channel b/se/test/test-channel
index 52af1b38e937..b9c58d57c78e 100755
--- a/se/test/test-channel
+++ b/se/test/test-channel
@@ -5,60 +5,66 @@ import dbus
 
 bus = dbus.SystemBus()
 
-def extract_byte_array(byte_array):
-        return ' '.join("{:02x}".format(byte) for byte in byte_array)
-
-def usage():
-        print("Usage: %s <command>" % (sys.argv[0]))
-        print("")
-        print("  list")
-        print("  send_apdu se/nfcX_<se_type>_seX channelX <apdu>")
-        sys.exit(1)
-
-if (len(sys.argv) < 2):
-        usage()
 
-if (sys.argv[1] == "list"):
-        if (len(sys.argv) != 3):
-                usage()
-        else:
-                path = "/org/neard/se/" + sys.argv[2]
-
-                seel = dbus.Interface(bus.get_object("org.neard.se", path),
-                                                        "org.neard.se.SecureElement")
-                properties = seel.GetProperties()
+def extract_byte_array(byte_array):
+    return " ".join("{:02x}".format(byte) for byte in byte_array)
 
-                for path in properties["Channels"]:
-                        print("[ %s ]" % (path))
 
-                        channel = dbus.Interface(bus.get_object("org.neard.se", path),
-                                                "org.neard.se.Channel")
-                        properties = channel.GetProperties()
+def usage():
+    print("Usage: %s <command>" % (sys.argv[0]))
+    print("")
+    print("  list")
+    print("  send_apdu se/nfcX_<se_type>_seX channelX <apdu>")
+    sys.exit(1)
 
-                        for key in properties.keys():
-                                if key in ["Basic"]:
-                                        if properties[key] == dbus.Boolean(1):
-                                                val = "true"
-                                        else:
-                                                val = "false"
-                                        print("    %s = %s" % (key, val))
 
-                                if key in ["AID"]:
-                                        print("    %s = %s" % (key, extract_byte_array(properties[key])))
-        sys.exit(0)
+if len(sys.argv) < 2:
+    usage()
 
-if (sys.argv[1] == "send_apdu"):
-        if (len(sys.argv) != 5):
-                usage()
-        else:
-                path = "/org/neard/se/" + sys.argv[2] + "/" + sys.argv[3]
+if sys.argv[1] == "list":
+    if len(sys.argv) != 3:
+        usage()
+    else:
+        path = "/org/neard/se/" + sys.argv[2]
+
+        seel = dbus.Interface(
+            bus.get_object("org.neard.se", path), "org.neard.se.SecureElement"
+        )
+        properties = seel.GetProperties()
+
+        for path in properties["Channels"]:
+            print("[ %s ]" % (path))
+
+            channel = dbus.Interface(
+                bus.get_object("org.neard.se", path), "org.neard.se.Channel"
+            )
+            properties = channel.GetProperties()
+
+            for key in properties.keys():
+                if key in ["Basic"]:
+                    if properties[key] == dbus.Boolean(1):
+                        val = "true"
+                    else:
+                        val = "false"
+                    print("    %s = %s" % (key, val))
+
+                if key in ["AID"]:
+                    print("    %s = %s" % (key, extract_byte_array(properties[key])))
+    sys.exit(0)
+
+if sys.argv[1] == "send_apdu":
+    if len(sys.argv) != 5:
+        usage()
+    else:
+        path = "/org/neard/se/" + sys.argv[2] + "/" + sys.argv[3]
 
-                channel = dbus.Interface(bus.get_object("org.neard.se", path),
-                                        "org.neard.se.Channel")
+        channel = dbus.Interface(
+            bus.get_object("org.neard.se", path), "org.neard.se.Channel"
+        )
 
-                response = channel.SendAPDU(sys.argv[4].decode("hex"))
+        response = channel.SendAPDU(sys.argv[4].decode("hex"))
 
-                print("--> %s" % extract_byte_array(response))
-        sys.exit(0)
+        print("--> %s" % extract_byte_array(response))
+    sys.exit(0)
 
 usage()
diff --git a/se/test/test-seel b/se/test/test-seel
index f3df3e7a7b95..21de41dd4877 100755
--- a/se/test/test-seel
+++ b/se/test/test-seel
@@ -5,110 +5,119 @@ import dbus
 
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
+
 
 def usage():
-        print("Usage: %s <command>" % (sys.argv[0]))
-        print("")
-        print("  list")
-        print("  enabled se/nfcX_<se_type>_seX [on/off]")
-        print("  open_channel se/nfcX_<se_type>_seX <AID>")
-        print("  close_channel se/nfcX_<se_type>_seX channelX")
-        sys.exit(1)
-
-if (len(sys.argv) < 2):
+    print("Usage: %s <command>" % (sys.argv[0]))
+    print("")
+    print("  list")
+    print("  enabled se/nfcX_<se_type>_seX [on/off]")
+    print("  open_channel se/nfcX_<se_type>_seX <AID>")
+    print("  close_channel se/nfcX_<se_type>_seX channelX")
+    sys.exit(1)
+
+
+if len(sys.argv) < 2:
+    usage()
+
+if sys.argv[1] == "list":
+    if len(sys.argv) != 2:
+        usage()
+    else:
+        manager = dbus.Interface(
+            bus.get_object("org.neard.se", "/"), "org.neard.se.Manager"
+        )
+        properties = manager.GetProperties()
+
+        for path in properties["SecureElements"]:
+            print("[ %s ]" % (path))
+
+            seel = dbus.Interface(
+                bus.get_object("org.neard.se", path), "org.neard.se.SecureElement"
+            )
+            properties = seel.GetProperties()
+
+            for key in properties.keys():
+                if key in ["Enabled"]:
+                    if properties[key] == dbus.Boolean(1):
+                        val = "true"
+                    else:
+                        val = "false"
+                    print("    %s = %s" % (key, val))
+
+                if key in ["Type"]:
+                    print("    %s = %s" % (key, str(properties[key])))
+
+                if key in ["Channels"]:
+                    print("    %s = %s" % (key, extract_list(properties[key])))
+    sys.exit(0)
+
+if sys.argv[1] == "enabled":
+    if len(sys.argv) < 4:
         usage()
+    else:
+        path = "/org/neard/se/" + sys.argv[2]
+
+        seel = dbus.Interface(
+            bus.get_object("org.neard.se", path), "org.neard.se.SecureElement"
+        )
+
+        try:
+            if sys.argv[3] == "on":
+                val = seel.SetProperty("Enabled", dbus.Boolean(1), timeout=10)
+            elif sys.argv[3] == "off":
+                val = seel.SetProperty("Enabled", dbus.Boolean(0), timeout=10)
+            else:
+                print("Invalid option %s" % sys.argv[3])
+
+        except dbus.DBusException as error:
+            print("%s: %s" % (error._dbus_error_name, error.message))
+    sys.exit(0)
+
+if sys.argv[1] == "open_channel":
+    if len(sys.argv) < 4:
+        usage()
+    else:
+        path = "/org/neard/se/" + sys.argv[2]
+
+        seel = dbus.Interface(
+            bus.get_object("org.neard.se", path), "org.neard.se.SecureElement"
+        )
+
+        try:
+            channel = seel.OpenChannel(sys.argv[3].decode("hex"))
 
-if (sys.argv[1] == "list"):
-        if (len(sys.argv) != 2):
-                usage()
-        else:
-                manager = dbus.Interface(bus.get_object("org.neard.se", "/"),
-                                                        "org.neard.se.Manager")
-                properties = manager.GetProperties()
-
-                for path in properties["SecureElements"]:
-                        print("[ %s ]" % (path))
-
-                        seel = dbus.Interface(bus.get_object("org.neard.se", path),
-                                                "org.neard.se.SecureElement")
-                        properties = seel.GetProperties()
-
-                        for key in properties.keys():
-                                if key in ["Enabled"]:
-                                        if properties[key] == dbus.Boolean(1):
-                                                val = "true"
-                                        else:
-                                                val = "false"
-                                        print("    %s = %s" % (key, val))
-
-                                if key in ["Type"]:
-                                        print("    %s = %s" % (key, str(properties[key])))
-
-                                if key in ["Channels"]:
-                                        print("    %s = %s" % (key, extract_list(properties[key])))
-        sys.exit(0)
-
-if (sys.argv[1] == "enabled"):
-        if (len(sys.argv) < 4):
-                usage()
-        else:
-                path = "/org/neard/se/" + sys.argv[2]
-
-                seel = dbus.Interface(bus.get_object("org.neard.se", path),
-                                        "org.neard.se.SecureElement")
-
-                try:
-                        if (sys.argv[3] == "on"):
-                                val = seel.SetProperty("Enabled", dbus.Boolean(1), timeout = 10)
-                        elif (sys.argv[3] == "off"):
-                                val = seel.SetProperty("Enabled", dbus.Boolean(0), timeout = 10)
-                        else:
-                                print("Invalid option %s" % sys.argv[3])
-
-                except dbus.DBusException as error:
-                        print("%s: %s" % (error._dbus_error_name, error.message))
-        sys.exit(0)
-
-if (sys.argv[1] == "open_channel"):
-        if (len(sys.argv) < 4):
-                usage()
-        else:
-                path = "/org/neard/se/" + sys.argv[2]
-
-                seel = dbus.Interface(bus.get_object("org.neard.se", path),
-                                        "org.neard.se.SecureElement")
-
-                try:
-                        channel = seel.OpenChannel(sys.argv[3].decode("hex"))
-
-                        print("Opened channel: %s" % str(channel))
-                except dbus.DBusException as error:
-                        print("%s: %s" % (error._dbus_error_name, error.message))
-        sys.exit(0)
-
-if (sys.argv[1] == "close_channel"):
-        if (len(sys.argv) < 4):
-                usage()
-        else:
-                seel_path = "/org/neard/se/" + sys.argv[2]
-                channel_path = seel_path + "/" + sys.argv[3]
-
-                seel = dbus.Interface(bus.get_object("org.neard.se", seel_path),
-                                        "org.neard.se.SecureElement")
-
-                channel = dbus.Interface(bus.get_object("org.neard.se", channel_path),
-                                        "org.neard.se.Channel")
-                try:
-                        seel.CloseChannel(channel)
-
-                except dbus.DBusException as error:
-                        print("%s: %s" % (error._dbus_error_name, error.message))
-        sys.exit(0)
+            print("Opened channel: %s" % str(channel))
+        except dbus.DBusException as error:
+            print("%s: %s" % (error._dbus_error_name, error.message))
+    sys.exit(0)
+
+if sys.argv[1] == "close_channel":
+    if len(sys.argv) < 4:
+        usage()
+    else:
+        seel_path = "/org/neard/se/" + sys.argv[2]
+        channel_path = seel_path + "/" + sys.argv[3]
+
+        seel = dbus.Interface(
+            bus.get_object("org.neard.se", seel_path), "org.neard.se.SecureElement"
+        )
+
+        channel = dbus.Interface(
+            bus.get_object("org.neard.se", channel_path), "org.neard.se.Channel"
+        )
+        try:
+            seel.CloseChannel(channel)
+
+        except dbus.DBusException as error:
+            print("%s: %s" % (error._dbus_error_name, error.message))
+    sys.exit(0)
 
 usage()
-- 
2.33.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
