Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADC43CD30D
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:59 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 189F7100EB84D;
	Mon, 19 Jul 2021 04:08:57 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7B0A2100EB823
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:54 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 7B4A5408B2
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692933;
	bh=joID9OAcp80Gk636ez1R6nMgk/+QY1DcgGov1Uesvf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=n9XsFZAjrZ423pO+iMT5jGloWsn9gH7jdJ+n5F3Rz3LJiJiWGb9UeaQ8Oa0UejHjD
	 TeyBpESRN5zmmoc9wVbj/C8scdiuSI1m6AZ48WvpSz0Ax8V2plx6cxbNwZUKFqQ3yd
	 Kps2g42Tug+y+XxXh0nJMnXFsPySrDSxxBHh6V1lFEgy8uvf5HZPR/0wvvS865KsCO
	 rsxTCoZDtQFXAKxWW3p9KJSFlOt2epXTDfUrMs9m2nOrlYxw2gv4CcAGzJ+g9KG3Vm
	 GhIij9IBUeXvcKmiB9rBa9JWViVrO7Y0l4pwyX1TA3QIMUXHCpFRzYJ37Pj/HmG+XV
	 RbTjz3KagLBhQ==
Received: by mail-lj1-f199.google.com with SMTP id q64-20020a2e5c430000b02901864030a0ecso9370327ljb.2
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=joID9OAcp80Gk636ez1R6nMgk/+QY1DcgGov1Uesvf0=;
        b=UNYST4fMZsShD4ivnzhmuRYy2WxRelvsERHfiMQ46314hko0K1ap+0KglQlFeG+AVE
         Qmagr0nVMQAYXdTZ0cJah0aGXY/5erI3zkRZYjoaQBGRnyuqL2bygw7pQvj1ZAMT1nj6
         xx/QRvvz5LBsTL2zPSihIHY53i9xwW2/Dud78inDvg8G02+ZaZI22/ab1dbjFdbJcCNF
         tbvUBvVT1tKbLdPcSgrAH/WVSXLGR5qxriNUzoolPI5zFik789vauxBNGmzcsgIDfvrf
         YQ1ehmiUhfzF1lR7DLzg/hzNrvm1g5erF0UErLyQDf3LMHngxKVqvIbevGM47D0x/HUi
         zmeg==
X-Gm-Message-State: AOAM531zVChlrA3byjH6hIIw+7RaNorw4hkHwIzjv6aT3w2UOHhERXE9
	n6JBzk/Ix+KF0MgBj/VPFjGado3rMOAC9Su5ku4VhXKABTE8kXAXrVArL39tFMH+byoTzXjlrfZ
	6Pqw5kVw1z5tv5qwZPrsBZESZrhbyNySo7A==
X-Received: by 2002:a2e:b4ac:: with SMTP id q12mr10931684ljm.477.1626692932767;
        Mon, 19 Jul 2021 04:08:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqNDCIaIJeiQlxg3kjs0wP2xGOhxx1uzNwV/KpSgjoodVlmcyi6prxGZ2ABWSl2Ao5MDPD9g==
X-Received: by 2002:a2e:b4ac:: with SMTP id q12mr10931673ljm.477.1626692932602;
        Mon, 19 Jul 2021 04:08:52 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:22 +0200
Message-Id: <20210719110819.27340-17-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: SI7ULVPTPUCEQ33X5VRVDAY4FYAO74AZ
X-Message-ID-Hash: SI7ULVPTPUCEQ33X5VRVDAY4FYAO74AZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 16/73] ndef: make freeing near_ndef_message reusable
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SI7ULVPTPUCEQ33X5VRVDAY4FYAO74AZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In few places the ndef record/message (struct near_ndef_message) is
allocated and not freed leading to memory leaks.  In few places it is
also open-coded.  Rename free_ndef_message() to near_ndef_msg_free()
and allow other parts to use it.  No functional change, except global
symbol.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/ndef.h |  1 +
 src/ndef.c     | 56 +++++++++++++++++++++++++-------------------------
 2 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/include/ndef.h b/include/ndef.h
index 5abdf343ee07..a21eed2654e9 100644
--- a/include/ndef.h
+++ b/include/ndef.h
@@ -44,6 +44,7 @@ GList *near_ndef_parse_msg(uint8_t *ndef_data, size_t ndef_length,
 					struct near_ndef_message **reply);
 
 void near_ndef_records_free(GList *records);
+void near_ndef_msg_free(struct near_ndef_message *record);
 
 struct near_ndef_message *near_ndef_prepare_text_record(char *encoding,
 					char *language_code, char *text);
diff --git a/src/ndef.c b/src/ndef.c
index 790655a279ba..0215bba0f3ae 100644
--- a/src/ndef.c
+++ b/src/ndef.c
@@ -832,15 +832,6 @@ static void free_ndef_record(struct near_ndef_record *record)
 	g_free(record);
 }
 
-static void free_ndef_message(struct near_ndef_message *msg)
-{
-	if (!msg)
-		return;
-
-	g_free(msg->data);
-	g_free(msg);
-}
-
 void __near_ndef_record_free(struct near_ndef_record *record)
 {
 	g_dbus_unregister_interface(connection, record->path,
@@ -1746,7 +1737,7 @@ static struct near_ndef_message *ndef_message_alloc_complete(char *type_name,
 
 fail:
 	near_error("ndef message struct allocation failed");
-	free_ndef_message(msg);
+	near_ndef_msg_free(msg);
 
 	return NULL;
 }
@@ -2009,8 +2000,8 @@ static int near_ndef_prepare_ac_and_cfg_records(enum record_type type,
 	g_free(local_carrier);
 
 	if (!*cfg || !*ac) {
-		free_ndef_message(*ac);
-		free_ndef_message(*cfg);
+		near_ndef_msg_free(*ac);
+		near_ndef_msg_free(*cfg);
 
 		return -ENOMEM;
 	}
@@ -2022,7 +2013,7 @@ static void free_ndef_list(gpointer data)
 {
 	struct near_ndef_message *msg = data;
 
-	free_ndef_message(msg);
+	near_ndef_msg_free(msg);
 }
 
 static struct near_ndef_message *prepare_handover_message_header(char *type,
@@ -2143,13 +2134,13 @@ static struct near_ndef_message *near_ndef_prepare_empty_hs_message(void)
 	if (hs_msg->offset > hs_msg->length)
 		goto fail;
 
-	free_ndef_message(ac_msg);
+	near_ndef_msg_free(ac_msg);
 
 	return hs_msg;
 
 fail:
-	free_ndef_message(ac_msg);
-	free_ndef_message(hs_msg);
+	near_ndef_msg_free(ac_msg);
+	near_ndef_msg_free(hs_msg);
 
 	return NULL;
 }
@@ -2266,7 +2257,7 @@ fail:
 	g_list_free_full(ac_msgs, free_ndef_list);
 	g_list_free_full(cfg_msgs, free_ndef_list);
 
-	free_ndef_message(hs_msg);
+	near_ndef_msg_free(hs_msg);
 
 	return NULL;
 }
@@ -2400,7 +2391,7 @@ near_ndef_prepare_ho_message(enum record_type type, GSList *carriers)
 
 	DBG("Handover message preparation is done");
 
-	free_ndef_message(cr_msg);
+	near_ndef_msg_free(cr_msg);
 	g_list_free_full(ac_msgs, free_ndef_list);
 	g_list_free_full(cfg_msgs, free_ndef_list);
 
@@ -2411,8 +2402,8 @@ fail:
 
 	g_list_free_full(ac_msgs, free_ndef_list);
 	g_list_free_full(cfg_msgs, free_ndef_list);
-	free_ndef_message(cr_msg);
-	free_ndef_message(ho_msg);
+	near_ndef_msg_free(cr_msg);
+	near_ndef_msg_free(ho_msg);
 
 	return NULL;
 }
@@ -2993,6 +2984,15 @@ void near_ndef_records_free(GList *records)
 	g_list_free(records);
 }
 
+void near_ndef_msg_free(struct near_ndef_message *msg)
+{
+	if (!msg)
+		return;
+
+	g_free(msg->data);
+	g_free(msg);
+}
+
 /*
  * Compute ndef records length, even though the submitted frame is incomplete.
  * This code is used in the handover read function, as we have to "guess" the
@@ -3160,7 +3160,7 @@ struct near_ndef_message *near_ndef_prepare_text_record(char *encoding,
 
 fail:
 	near_error("text record preparation failed");
-	free_ndef_message(msg);
+	near_ndef_msg_free(msg);
 
 	return NULL;
 }
@@ -3199,7 +3199,7 @@ struct near_ndef_message *near_ndef_prepare_uri_record(uint8_t identifier,
 
 fail:
 	near_error("uri record preparation failed");
-	free_ndef_message(msg);
+	near_ndef_msg_free(msg);
 
 	return NULL;
 }
@@ -3228,15 +3228,15 @@ near_ndef_prepare_smartposter_record(uint8_t uri_identifier,
 	if (msg->offset > msg->length)
 		goto fail;
 
-	free_ndef_message(uri);
+	near_ndef_msg_free(uri);
 
 	return msg;
 
 fail:
 	near_error("smartposter record preparation failed");
 
-	free_ndef_message(uri);
-	free_ndef_message(msg);
+	near_ndef_msg_free(uri);
+	near_ndef_msg_free(msg);
 
 	return NULL;
 }
@@ -3902,7 +3902,7 @@ struct near_ndef_message *__ndef_build_from_message(DBusMessage *msg)
 		if (!ndef_message_append(ndef, record))
 			goto err;
 
-		free_ndef_message(record);
+		near_ndef_msg_free(record);
 	next:
 		if (end)
 			break;
@@ -3912,8 +3912,8 @@ struct near_ndef_message *__ndef_build_from_message(DBusMessage *msg)
 exit:
 	return ndef;
 err:
-	free_ndef_message(ndef);
-	free_ndef_message(record);
+	near_ndef_msg_free(ndef);
+	near_ndef_msg_free(record);
 	ndef = NULL;
 	goto exit;
 }
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
