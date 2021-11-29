Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BD6460E4A
	for <lists+linux-nfc@lfdr.de>; Mon, 29 Nov 2021 06:06:35 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3FBB8100EA2B7;
	Sun, 28 Nov 2021 21:06:33 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id AE88F100F2240
	for <linux-nfc@lists.01.org>; Sun, 28 Nov 2021 21:06:31 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id C96BB32009E5;
	Mon, 29 Nov 2021 00:06:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 29 Nov 2021 00:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=qGIptqNxekyp7
	NcIMa36jZU6vyPNZmDtgOnhpExvIu0=; b=atbLw+rxknDUxqxy8S+dSqerxP8sJ
	T3rDkc3gfoNqTW0oWmax2JnCCYbPzGmphN7TDZ54HGkjLjWdlNU6RrkNsLX0wEBx
	l0jyRldBp8ti6RfyzVgOQP/OTuv+GSB0nwYpqA+y+FDT4sV8yeX0nTgkrWz5Cf/d
	jseyZXreY9q/Dy8CEyVmQRvCE+uB3Kj085tofej+ibB7ryE4RzlswsHq6Q7RB+OO
	/jEIxx+FCfPmscn5e5ry8iEgbo7otwkLx5kad0P+7s5iIOFRrVItHn1AUrNMoO7P
	0LtPPMxGC8gfEumgK5zj0LW1TG2tp0wC8mYQMlxWzKq6QzgWqXsowwQBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=qGIptqNxekyp7NcIMa36jZU6vyPNZmDtgOnhpExvIu0=; b=Hl1W1Tso
	ZltpS0rdn11utoPh7zdt0CKzTojufAvFYSsUyvFgk8wSbsSr5NrquVApFhCHgfJM
	jl582iebFNkdVdRFuYobK/GbGUubQ6Knm0Xd5MKmIoRwYkrO8/ilicA4Lymmz/40
	NefsEIW0upxM9u2w0+f0TT+V550yQ7hDC04inaPRQmah8cxw8SiohsrkR3B/agHQ
	DayJSNnIC27XH37zCJsxeb/9WFFzH3BfAC8MQZ2PFVNrj9LMieaMCp9mBueMpzC2
	mkDEahB5elJzPcTSacP7HfnkvmRP2QeKT9otiTGrizXSeS4Q8k/t8os75eIL8s3G
	xYCaOl+0DquReA==
X-ME-Sender: <xms:1l-kYenVFBO-tNVJrrzDXyMQmZxDk_GLtJzYowLslrdrsW3fM1UnbQ>
    <xme:1l-kYV2G0GCstr9VorMmT5Wlxs7OJL9tgpY-W4wRMMyZfmT3M60IqFJa7LkYn8Leh
    eDk1Y6F0yC4hIncOQ>
X-ME-Received: <xmr:1l-kYcobnQxBDbEICda0Y48OULm6PR7JefP1_oUuFIRhnT4BRgNuqKTauZxq75cQMyKOFwI2o7znHePnskuCKNm10y063_61WpPasLE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfi
    rhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtffrrg
    htthgvrhhnpeetheeivefgkefhfedvjeejgfejjeeugedtkeefgeekieefheetvddtveff
    kefftdenucffohhmrghinhepphihthhhohhnrdhorhhgpdhnvggrrhgurdhsvgenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhes
    rghnihhmrghltghrvggvkhdrtghomh
X-ME-Proxy: <xmx:1l-kYSm995QKqphJ3gzeNeYAzU7xBEbOM0Grnu-Gwg0RO0ZhYX2ZVQ>
    <xmx:1l-kYc0kfi2tN6DdZGcJaFnPpxpGhvI_C5hVNhSOOocHW18XqvJSmw>
    <xmx:1l-kYZt1qOdt8RLU9ad_XYEG7JMm2HTG1uwtGSAkGYhT7-dHQZgxww>
    <xmx:1l-kYZ_kr_vlPTrWD04_ItpJc6UycxDX4IM0dh8SwlQR0MbRIbWs4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 00:06:29 -0500 (EST)
Received: from blue.animalcreek.com (localhost [127.0.0.1])
	by blue.animalcreek.com (Postfix) with ESMTP id 3EB0813604AB;
	Sun, 28 Nov 2021 22:06:29 -0700 (MST)
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Date: Sun, 28 Nov 2021 22:06:04 -0700
Message-Id: <20211129050606.873494-5-mgreer@animalcreek.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211129050606.873494-1-mgreer@animalcreek.com>
References: <20211129050606.873494-1-mgreer@animalcreek.com>
MIME-Version: 1.0
Message-ID-Hash: QB63V5CE7K5AT3X4JDQCYZ6CLYZUZGSO
X-Message-ID-Hash: QB63V5CE7K5AT3X4JDQCYZ6CLYZUZGSO
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 4/6] se: Use spaces only for SE Python test scripts
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QB63V5CE7K5AT3X4JDQCYZ6CLYZUZGSO/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Python PEP 8 style guide prefers spaces over tabs so replace all
tabs in the SE Python test scripts with spaces. See:

	https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces

Signed-off-by: Mark Greer <mgreer@animalcreek.com>
---
 se/test/test-channel |  84 ++++++++++----------
 se/test/test-seel    | 178 +++++++++++++++++++++----------------------
 2 files changed, 131 insertions(+), 131 deletions(-)

diff --git a/se/test/test-channel b/se/test/test-channel
index e6ed0114c8c8..5fa9b7e7fc41 100755
--- a/se/test/test-channel
+++ b/se/test/test-channel
@@ -6,59 +6,59 @@ import dbus
 bus = dbus.SystemBus()
 
 def extract_byte_array(byte_array):
-	return ' '.join("{:02x}".format(byte) for byte in byte_array)
+        return ' '.join("{:02x}".format(byte) for byte in byte_array)
 
 def usage():
-	print "Usage: %s <command>" % (sys.argv[0])
-	print ""
-	print "  list"
-	print "  send_apdu se/nfcX_<se_type>_seX channelX <apdu>"
-	sys.exit(1)
+        print "Usage: %s <command>" % (sys.argv[0])
+        print ""
+        print "  list"
+        print "  send_apdu se/nfcX_<se_type>_seX channelX <apdu>"
+        sys.exit(1)
 
 if (len(sys.argv) < 2):
         usage()
 
 if (sys.argv[1] == "list"):
-	if (len(sys.argv) != 3):
-		usage()
-	else:
-		path = "/org/neard/se/" + sys.argv[2]
-
-		seel = dbus.Interface(bus.get_object("org.neard.se", path),
-							"org.neard.se.SecureElement")
-		properties = seel.GetProperties()
-
-		for path in properties["Channels"]:
-			print "[ %s ]" % (path)
-
-			channel = dbus.Interface(bus.get_object("org.neard.se", path),
-						"org.neard.se.Channel")
-			properties = channel.GetProperties()
-
-			for key in properties.keys():
-				if key in ["Basic"]:
-					if properties[key] == dbus.Boolean(1):
-						val = "true"
-					else:
-						val = "false"
-					print "    %s = %s" % (key, val)
-
-				if key in ["AID"]:
-					print "    %s = %s" % (key, extract_byte_array(properties[key]))
-	sys.exit(0)
+        if (len(sys.argv) != 3):
+                usage()
+        else:
+                path = "/org/neard/se/" + sys.argv[2]
+
+                seel = dbus.Interface(bus.get_object("org.neard.se", path),
+                                                        "org.neard.se.SecureElement")
+                properties = seel.GetProperties()
+
+                for path in properties["Channels"]:
+                        print "[ %s ]" % (path)
+
+                        channel = dbus.Interface(bus.get_object("org.neard.se", path),
+                                                "org.neard.se.Channel")
+                        properties = channel.GetProperties()
+
+                        for key in properties.keys():
+                                if key in ["Basic"]:
+                                        if properties[key] == dbus.Boolean(1):
+                                                val = "true"
+                                        else:
+                                                val = "false"
+                                        print "    %s = %s" % (key, val)
+
+                                if key in ["AID"]:
+                                        print "    %s = %s" % (key, extract_byte_array(properties[key]))
+        sys.exit(0)
 
 if (sys.argv[1] == "send_apdu"):
-	if (len(sys.argv) != 5):
-		usage()
-	else:
-		path = "/org/neard/se/" + sys.argv[2] + "/" + sys.argv[3]
+        if (len(sys.argv) != 5):
+                usage()
+        else:
+                path = "/org/neard/se/" + sys.argv[2] + "/" + sys.argv[3]
 
-		channel = dbus.Interface(bus.get_object("org.neard.se", path),
-					"org.neard.se.Channel")
+                channel = dbus.Interface(bus.get_object("org.neard.se", path),
+                                        "org.neard.se.Channel")
 
-		response = channel.SendAPDU(sys.argv[4].decode("hex"))
+                response = channel.SendAPDU(sys.argv[4].decode("hex"))
 
-		print "--> %s" % extract_byte_array(response)
-	sys.exit(0)
+                print "--> %s" % extract_byte_array(response)
+        sys.exit(0)
 
 usage()
diff --git a/se/test/test-seel b/se/test/test-seel
index e238a38851a9..16c797dbc6fc 100755
--- a/se/test/test-seel
+++ b/se/test/test-seel
@@ -6,109 +6,109 @@ import dbus
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
-	print "Usage: %s <command>" % (sys.argv[0])
-	print ""
-	print "  list"
-	print "  enabled se/nfcX_<se_type>_seX [on/off]"
-	print "  open_channel se/nfcX_<se_type>_seX <AID>"
-	print "  close_channel se/nfcX_<se_type>_seX channelX"
-	sys.exit(1)
+        print "Usage: %s <command>" % (sys.argv[0])
+        print ""
+        print "  list"
+        print "  enabled se/nfcX_<se_type>_seX [on/off]"
+        print "  open_channel se/nfcX_<se_type>_seX <AID>"
+        print "  close_channel se/nfcX_<se_type>_seX channelX"
+        sys.exit(1)
 
 if (len(sys.argv) < 2):
-	usage()
+        usage()
 
 if (sys.argv[1] == "list"):
-	if (len(sys.argv) != 2):
-		usage()
-	else:
-		manager = dbus.Interface(bus.get_object("org.neard.se", "/"),
-							"org.neard.se.Manager")
-		properties = manager.GetProperties()
-
-		for path in properties["SecureElements"]:
-			print "[ %s ]" % (path)
-
-			seel = dbus.Interface(bus.get_object("org.neard.se", path),
-						"org.neard.se.SecureElement")
-			properties = seel.GetProperties()
-
-			for key in properties.keys():
-				if key in ["Enabled"]:
-					if properties[key] == dbus.Boolean(1):
-						val = "true"
-					else:
-						val = "false"
-					print "    %s = %s" % (key, val)
-
-				if key in ["Type"]:
-					print "    %s = %s" % (key, str(properties[key]))
-
-				if key in ["Channels"]:
-					print "    %s = %s" % (key, extract_list(properties[key]))
-	sys.exit(0)
+        if (len(sys.argv) != 2):
+                usage()
+        else:
+                manager = dbus.Interface(bus.get_object("org.neard.se", "/"),
+                                                        "org.neard.se.Manager")
+                properties = manager.GetProperties()
+
+                for path in properties["SecureElements"]:
+                        print "[ %s ]" % (path)
+
+                        seel = dbus.Interface(bus.get_object("org.neard.se", path),
+                                                "org.neard.se.SecureElement")
+                        properties = seel.GetProperties()
+
+                        for key in properties.keys():
+                                if key in ["Enabled"]:
+                                        if properties[key] == dbus.Boolean(1):
+                                                val = "true"
+                                        else:
+                                                val = "false"
+                                        print "    %s = %s" % (key, val)
+
+                                if key in ["Type"]:
+                                        print "    %s = %s" % (key, str(properties[key]))
+
+                                if key in ["Channels"]:
+                                        print "    %s = %s" % (key, extract_list(properties[key]))
+        sys.exit(0)
 
 if (sys.argv[1] == "enabled"):
-	if (len(sys.argv) < 4):
-		usage()
-	else:
-		path = "/org/neard/se/" + sys.argv[2]
-
-		seel = dbus.Interface(bus.get_object("org.neard.se", path),
-					"org.neard.se.SecureElement")
-
-		try:
-			if (sys.argv[3] == "on"):
-				val = seel.SetProperty("Enabled", dbus.Boolean(1), timeout = 10)
-			elif (sys.argv[3] == "off"):
-				val = seel.SetProperty("Enabled", dbus.Boolean(0), timeout = 10)
-			else:
-				print "Invalid option %s" % sys.argv[3]
-
-		except dbus.DBusException, error:
-			print "%s: %s" % (error._dbus_error_name, error.message)
-	sys.exit(0)
+        if (len(sys.argv) < 4):
+                usage()
+        else:
+                path = "/org/neard/se/" + sys.argv[2]
+
+                seel = dbus.Interface(bus.get_object("org.neard.se", path),
+                                        "org.neard.se.SecureElement")
+
+                try:
+                        if (sys.argv[3] == "on"):
+                                val = seel.SetProperty("Enabled", dbus.Boolean(1), timeout = 10)
+                        elif (sys.argv[3] == "off"):
+                                val = seel.SetProperty("Enabled", dbus.Boolean(0), timeout = 10)
+                        else:
+                                print "Invalid option %s" % sys.argv[3]
+
+                except dbus.DBusException, error:
+                        print "%s: %s" % (error._dbus_error_name, error.message)
+        sys.exit(0)
 
 if (sys.argv[1] == "open_channel"):
-	if (len(sys.argv) < 4):
-		usage()
-	else:
-		path = "/org/neard/se/" + sys.argv[2]
+        if (len(sys.argv) < 4):
+                usage()
+        else:
+                path = "/org/neard/se/" + sys.argv[2]
 
-		seel = dbus.Interface(bus.get_object("org.neard.se", path),
-					"org.neard.se.SecureElement")
+                seel = dbus.Interface(bus.get_object("org.neard.se", path),
+                                        "org.neard.se.SecureElement")
 
-		try:
-			channel = seel.OpenChannel(sys.argv[3].decode("hex"))
+                try:
+                        channel = seel.OpenChannel(sys.argv[3].decode("hex"))
 
-			print "Opened channel: %s" % str(channel)
-		except dbus.DBusException, error:
-			print "%s: %s" % (error._dbus_error_name, error.message)
-	sys.exit(0)
+                        print "Opened channel: %s" % str(channel)
+                except dbus.DBusException, error:
+                        print "%s: %s" % (error._dbus_error_name, error.message)
+        sys.exit(0)
 
 if (sys.argv[1] == "close_channel"):
-	if (len(sys.argv) < 4):
-		usage()
-	else:
-		seel_path = "/org/neard/se/" + sys.argv[2]
-		channel_path = seel_path + "/" + sys.argv[3]
-
-		seel = dbus.Interface(bus.get_object("org.neard.se", seel_path),
-					"org.neard.se.SecureElement")
-
-		channel = dbus.Interface(bus.get_object("org.neard.se", channel_path),
-					"org.neard.se.Channel")
-		try:
-			seel.CloseChannel(channel)
-
-		except dbus.DBusException, error:
-			print "%s: %s" % (error._dbus_error_name, error.message)
-	sys.exit(0)
+        if (len(sys.argv) < 4):
+                usage()
+        else:
+                seel_path = "/org/neard/se/" + sys.argv[2]
+                channel_path = seel_path + "/" + sys.argv[3]
+
+                seel = dbus.Interface(bus.get_object("org.neard.se", seel_path),
+                                        "org.neard.se.SecureElement")
+
+                channel = dbus.Interface(bus.get_object("org.neard.se", channel_path),
+                                        "org.neard.se.Channel")
+                try:
+                        seel.CloseChannel(channel)
+
+                except dbus.DBusException, error:
+                        print "%s: %s" % (error._dbus_error_name, error.message)
+        sys.exit(0)
 
 usage()
-- 
2.33.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
