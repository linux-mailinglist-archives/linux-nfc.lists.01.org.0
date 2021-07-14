Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5833C836C
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:50 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6682D100EAB42;
	Wed, 14 Jul 2021 04:05:44 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 42359100F2274
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:42 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 343F04054E
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260741;
	bh=HopS/Og9/KFZGd//wsrycXtk+qCK2Kt5zxqtWvyqS/8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=WBrOPdzuhfsKpVVBr0At/Ya30UCbdjODqE1Bk0jpp5SLcac7OfhuLnYp9yWULwpUW
	 /rsHpzQU1Sas9qxhQ6X1JzJchXIuOG4Z6tzN6wtEHQOanm8cCsiOfqgFmqj4MKnKp9
	 5h9k2Dhw3S+jZEOUjVgpwobio7mL+/QypV/co1FKW+ZKDJ6/wZuUAyZH/dbnk5Kb6Z
	 /uG+vdKr24euER99QNo4oTVH+D4KTaKHLXXj+nK7VVPD0++D4awA/FU+9hiPm8dEE/
	 a0He7QIMa/r2wYmIq/IoRAhxUvam0m6vAiedTpqHwcSR7ji416VAQYbeKdgxg9hx2J
	 Ppt0BQU7j6qZw==
Received: by mail-ed1-f70.google.com with SMTP id cw12-20020a056402228cb02903a4b3e93e15so1065041edb.2
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HopS/Og9/KFZGd//wsrycXtk+qCK2Kt5zxqtWvyqS/8=;
        b=FWwV6zstu0YY2XcxFXQWAyN6jQyDQQ1sS0VWmXLGus67K7+/lKPPZA2ZoIIrLDZCrG
         u3PlxouixbjFogaIbK9ZVAducsRY32hNBHuMPIIWsJ4QoY5cYOnOz5vU2QlQgSVdtsCm
         4xW2VxX3vl/TLLDoFTl/fjanvjhPAhXavUPvqTjZ4vj6duk2YAruHjDXOPa15H1WYDkG
         szYcAXp3HYngRKhUEblbSzGyQ2JTHPccggdaQz79KxAsP+J/1/jRklnu+lKk34KV6g0+
         BKvqFodioMP0Ls+4jPoRFoMWWuIQPO9Inf0D4naCYmQgVpFZ2K5Be21q5/5C4aQpJf3S
         yhRA==
X-Gm-Message-State: AOAM532ND7H4yrRTcH+4AZkDC1DLu+YGJxGfEqqA9qhb+ipIjAL8SVqE
	PfPLn5dtN2e53WJV/4qOHE8Og2uvyf77YU4HyHyljAJmBBNHTEfMhzO6zowZlk9mQ0+UId1cW/q
	CoSIBsizilkxkjZ8CKI52dS+r4eIO+okzxQ==
X-Received: by 2002:a17:906:a98e:: with SMTP id jr14mr11687396ejb.450.1626260740666;
        Wed, 14 Jul 2021 04:05:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNgudIOdk4Q77gKLtNkU8XhRqjZ6bxVvNl7E3HQ2YORWv1UAtZU31KAVIKS6HOMyXjZ6MS1Q==
X-Received: by 2002:a17:906:a98e:: with SMTP id jr14mr11687381ejb.450.1626260740432;
        Wed, 14 Jul 2021 04:05:40 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:13 +0200
Message-Id: <20210714110518.104655-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: X6ZJXWRM3AHVQHWBXAKO2QWXPB7K2ECU
X-Message-ID-Hash: X6ZJXWRM3AHVQHWBXAKO2QWXPB7K2ECU
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 11/16] ndef: make freeing near_ndef_message reusable
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/X6ZJXWRM3AHVQHWBXAKO2QWXPB7K2ECU/>
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
index 66faf7867399..3dd8838ef9e6 100644
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
@@ -1752,7 +1743,7 @@ static struct near_ndef_message *ndef_message_alloc_complete(char *type_name,
 
 fail:
 	near_error("ndef message struct allocation failed");
-	free_ndef_message(msg);
+	near_ndef_msg_free(msg);
 
 	return NULL;
 }
@@ -2015,8 +2006,8 @@ static int near_ndef_prepare_ac_and_cfg_records(enum record_type type,
 	g_free(local_carrier);
 
 	if (!*cfg || !*ac) {
-		free_ndef_message(*ac);
-		free_ndef_message(*cfg);
+		near_ndef_msg_free(*ac);
+		near_ndef_msg_free(*cfg);
 
 		return -ENOMEM;
 	}
@@ -2028,7 +2019,7 @@ static void free_ndef_list(gpointer data)
 {
 	struct near_ndef_message *msg = data;
 
-	free_ndef_message(msg);
+	near_ndef_msg_free(msg);
 }
 
 static struct near_ndef_message *prepare_handover_message_header(char *type,
@@ -2149,13 +2140,13 @@ static struct near_ndef_message *near_ndef_prepare_empty_hs_message(void)
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
@@ -2272,7 +2263,7 @@ fail:
 	g_list_free_full(ac_msgs, free_ndef_list);
 	g_list_free_full(cfg_msgs, free_ndef_list);
 
-	free_ndef_message(hs_msg);
+	near_ndef_msg_free(hs_msg);
 
 	return NULL;
 }
@@ -2406,7 +2397,7 @@ near_ndef_prepare_ho_message(enum record_type type, GSList *carriers)
 
 	DBG("Handover message preparation is done");
 
-	free_ndef_message(cr_msg);
+	near_ndef_msg_free(cr_msg);
 	g_list_free_full(ac_msgs, free_ndef_list);
 	g_list_free_full(cfg_msgs, free_ndef_list);
 
@@ -2417,8 +2408,8 @@ fail:
 
 	g_list_free_full(ac_msgs, free_ndef_list);
 	g_list_free_full(cfg_msgs, free_ndef_list);
-	free_ndef_message(cr_msg);
-	free_ndef_message(ho_msg);
+	near_ndef_msg_free(cr_msg);
+	near_ndef_msg_free(ho_msg);
 
 	return NULL;
 }
@@ -2999,6 +2990,15 @@ void near_ndef_records_free(GList *records)
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
@@ -3166,7 +3166,7 @@ struct near_ndef_message *near_ndef_prepare_text_record(char *encoding,
 
 fail:
 	near_error("text record preparation failed");
-	free_ndef_message(msg);
+	near_ndef_msg_free(msg);
 
 	return NULL;
 }
@@ -3205,7 +3205,7 @@ struct near_ndef_message *near_ndef_prepare_uri_record(uint8_t identifier,
 
 fail:
 	near_error("uri record preparation failed");
-	free_ndef_message(msg);
+	near_ndef_msg_free(msg);
 
 	return NULL;
 }
@@ -3234,15 +3234,15 @@ near_ndef_prepare_smartposter_record(uint8_t uri_identifier,
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
@@ -3908,7 +3908,7 @@ struct near_ndef_message *__ndef_build_from_message(DBusMessage *msg)
 		if (!ndef_message_append(ndef, record))
 			goto err;
 
-		free_ndef_message(record);
+		near_ndef_msg_free(record);
 	next:
 		if (end)
 			break;
@@ -3918,8 +3918,8 @@ struct near_ndef_message *__ndef_build_from_message(DBusMessage *msg)
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
