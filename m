Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEBF3C8364
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:39 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CBD27100F2245;
	Wed, 14 Jul 2021 04:05:34 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 9F496100EB34F
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:32 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 1DD774054A
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260729;
	bh=LuODje3FSrOJcLHcStf2dY7jljmM2ex8bX0jdi4e2OE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=t3hL6TYyICmoyzdHPkSUHKdx3QqAHeLQFGtOPZVEgfDV7aommFR+V2qrGNVl9OaI/
	 aDbm06sBc28jMrD3hMQzETulfwaJOweWB+uz4SFEsLzLQB/ai5esTOz1hTj6N7Z6zz
	 k24+Q7TmvvyylsZ3DmpL11ubORuLmHApAiN6NL929kEgfiMiHJ9A+7Ct64lHEUbod6
	 cJJ+qApInMaqM4fhCjYwtXYI7Q6nJ9CDb5aH8BqwGlpEGmok2w34iS0hmPP9rDXawZ
	 tzAwSJDP+zslxnhUOcikvh0jaoc2rs1ncY+ApNEwcDG3udhUOba0Av+t3d3d5tLXQJ
	 WzAlMDSn2ugfA==
Received: by mail-ej1-f70.google.com with SMTP id de27-20020a1709069bdbb02904dedfc43879so658798ejc.1
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LuODje3FSrOJcLHcStf2dY7jljmM2ex8bX0jdi4e2OE=;
        b=Xq7uVYkaQJ07hqULf45dbnS/Dv5kd+oXRRTXvZjAq0bVZmmpcfybVOztNZrXbpFbjL
         WedWYZkvxzsJ9HoeFhwXDpVGSpdq5zlc3XJ+sKmtW56MWliL0jE1sxHbTeX99NM+1wSf
         4MVYMbRQiWI5E9vkLfKXSMu2AGCY6zBe47ZAtXIWhZAae8LZTk8WgH5W9Getuwr+tq73
         RSgOZuwv36Rsv3pMxXFiNB6AFC9Cj8HOhcP0XjhEKS3LKfWd0pzREfXeoU+9H5LsmXGR
         SIaVG14pKT7Dgtw8zHitUONitiBllVdROVO2WhPJx51BSB3n3nQupTzboMJWcR+epjj2
         gJbA==
X-Gm-Message-State: AOAM532zoHCj4NjDNhtGqWToEDtQCSRE2sg5+auV8Z4nEq3+GHASwXg7
	8rznJ3FWO4a2trtMO9ggh7hv9Cr1t+8SvSvHzEVQi/2jq/TDHFAd7VgkpEbDMnIUsKHT9jlsyzb
	IR//glC5Bz08QS6Crns0rL9rkGK1aZY8DoQ==
X-Received: by 2002:a17:906:31cb:: with SMTP id f11mr11826135ejf.379.1626260728634;
        Wed, 14 Jul 2021 04:05:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysJJJV1XxVrz2YA0JaDk75w+OAr34fwNIEmhd7YP5qwrR/AWdfHH3qWGVBR1xWTOvh0J9sfQ==
X-Received: by 2002:a17:906:31cb:: with SMTP id f11mr11825940ejf.379.1626260726222;
        Wed, 14 Jul 2021 04:05:26 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:03 +0200
Message-Id: <20210714110518.104655-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: OKXNNA2HJ7XXWPZPXE672PVS7CDNPW45
X-Message-ID-Hash: OKXNNA2HJ7XXWPZPXE672PVS7CDNPW45
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 01/16] gdbus: annotate printf-like functions as accepting format
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OKXNNA2HJ7XXWPZPXE672PVS7CDNPW45/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Printf-like functions should have the "format" argument annotated to:
1. Help in detection of format string vulnerabilities (and mistakes).
2. Satisfy -Wformat-nonliteral (-Wformat=2) warning.

This fixes clang warnings like:

    gdbus/object.c:1416:31: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
                    vsnprintf(str, sizeof(str), format, args);
                                                ^~~~~~

    src/adapter.c:255:7: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                                                    strerror(err));
                                                    ^~~~~~~~~~~~~
    src/adapter.c:255:7: note: treat the string as an argument to avoid this
                                                    strerror(err));
                                                    ^
                                                    "%s",

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 gdbus/gdbus.h | 15 ++++++++++-----
 src/adapter.c |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/gdbus/gdbus.h b/gdbus/gdbus.h
index d99c2549d056..e9ffd029e178 100644
--- a/gdbus/gdbus.h
+++ b/gdbus/gdbus.h
@@ -239,13 +239,15 @@ void g_dbus_pending_error(DBusConnection *connection,
 					__attribute__((format(printf, 4, 5)));
 void g_dbus_pending_error_valist(DBusConnection *connection,
 				GDBusPendingReply pending, const char *name,
-					const char *format, va_list args);
+				const char *format, va_list args)
+				__attribute__ ((format (printf, 4, 0)));
 
 DBusMessage *g_dbus_create_error(DBusMessage *message, const char *name,
 						const char *format, ...)
 					__attribute__((format(printf, 3, 4)));
 DBusMessage *g_dbus_create_error_valist(DBusMessage *message, const char *name,
-					const char *format, va_list args);
+					const char *format, va_list args)
+					__attribute__ ((format (printf, 3, 0)));
 DBusMessage *g_dbus_create_reply(DBusMessage *message, int type, ...);
 DBusMessage *g_dbus_create_reply_valist(DBusMessage *message,
 						int type, va_list args);
@@ -259,7 +261,8 @@ gboolean g_dbus_send_error(DBusConnection *connection, DBusMessage *message,
 					 __attribute__((format(printf, 4, 5)));
 gboolean g_dbus_send_error_valist(DBusConnection *connection,
 					DBusMessage *message, const char *name,
-					const char *format, va_list args);
+					const char *format, va_list args)
+					__attribute__ ((format (printf, 4, 0)));
 gboolean g_dbus_send_reply(DBusConnection *connection,
 				DBusMessage *message, int type, ...);
 gboolean g_dbus_send_reply_valist(DBusConnection *connection,
@@ -294,9 +297,11 @@ void g_dbus_remove_all_watches(DBusConnection *connection);
 
 void g_dbus_pending_property_success(GDBusPendingPropertySet id);
 void g_dbus_pending_property_error_valist(GDBusPendingReply id,
-			const char *name, const char *format, va_list args);
+			const char *name, const char *format, va_list args)
+			__attribute__ ((format (printf, 3, 0)));
 void g_dbus_pending_property_error(GDBusPendingReply id, const char *name,
-						const char *format, ...);
+				   const char *format, ...)
+				   __attribute__((format(printf, 3, 4)));
 void g_dbus_emit_property_changed(DBusConnection *connection,
 				const char *path, const char *interface,
 				const char *name);
diff --git a/src/adapter.c b/src/adapter.c
index 420127f4f396..e0ab8c5d6055 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -252,6 +252,7 @@ static void set_powered(GDBusPendingPropertySet id, dbus_bool_t powered,
 
 		g_dbus_pending_property_error(id,
 						NFC_ERROR_INTERFACE ".Failed",
+						"%s",
 						strerror(err));
 
 		return;
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
