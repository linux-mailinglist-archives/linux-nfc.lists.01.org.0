Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7D93CD323
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:22 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BD4B9100EB32F;
	Mon, 19 Jul 2021 04:09:20 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id DCE06100EB333
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:18 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id DFDE640207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692957;
	bh=LuODje3FSrOJcLHcStf2dY7jljmM2ex8bX0jdi4e2OE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=m2dw/ieruWvY/XnNIvMeTvJVv1PKoWzArJab/igiy0JV5lOnUAUdcT0utSaP5y+U/
	 wktCyro9Xm+rkJwOntKGsF/3LtqBmIUFxhz53PMKwZvDJXbIJoxvqyeLlk4atUEt7h
	 CaAt3LR9pRaPGGEWrNmnInxsEFUEnGi2YPExLqZan++d55XwveO/VQxNt9mqN7wmo1
	 S2UXQKcejMOQ9SxwmRieBnA+vdGTs2hbA+/rhFWOds08I4qp3jcZE2UuQPJErFNOUa
	 cxpxbqTurS6sN7sZd0UmlTIJ38p+P7Ejlh3BYShPpVSPG3dW08fYM3QNg1AgyvgtAJ
	 5Z9nWmXD2cV4g==
Received: by mail-lf1-f71.google.com with SMTP id q12-20020a056512210cb029037107a2a7aeso3250188lfr.6
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LuODje3FSrOJcLHcStf2dY7jljmM2ex8bX0jdi4e2OE=;
        b=HyOpC9rSUZqeKMS0dEbpY26SoD+e11evjMI80+ii65asf3jh8WyWHiNq/yu45WRLH6
         XgdfurM3WQKh+p4VNDEaSPeXcSCyze1FRLJMRytSmAq8XqliUAHArCAdtJEpowsvEtL9
         fGpxfJhxphlG7eQL9b7LVIlnbEUFAfQY/uiNRkw8tl48H7Zjlh6DmplFdYN5i/z07STV
         yBGAanZwoJAR+AvEAd5LdFjnJP1j3gMmzXi5xX1LCrmRUISXaFlxJhg3ttV1YxMkGSZo
         6+NhQOQvjHJQTsW2IGDR6p6/ylf070UniNOKmzI4Vx+LThaUiEHblndPjlW6WB4a8JRV
         ryzg==
X-Gm-Message-State: AOAM533PB3nLFqLpx8hAGePtIFe39LPLijDEkrNkUVpZcd7Q++CA1+oM
	nUbdCt/k6FUbD2o74Be9x0NTAjSydnTZ9T6bBLDvAjW0xclxntfkZgEeaxeHlC4QwHAqLeC2Tch
	IPUV29YLoRZchkZKZBRWIl8PqfdZiHUKa0w==
X-Received: by 2002:a2e:bd86:: with SMTP id o6mr22424279ljq.84.1626692957157;
        Mon, 19 Jul 2021 04:09:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyQIL1SViRfeiFNTtLmQHHCVCZOVcEq1x7isGcfQxXhR9wjQEEPK2EKx+00UBBduHrUhVaGA==
X-Received: by 2002:a2e:bd86:: with SMTP id o6mr22424267ljq.84.1626692956948;
        Mon, 19 Jul 2021 04:09:16 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:43 +0200
Message-Id: <20210719110819.27340-38-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: DUVFCWMIP7CAZ6PQZNKTOHZOQO24Z5X3
X-Message-ID-Hash: DUVFCWMIP7CAZ6PQZNKTOHZOQO24Z5X3
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 37/73] gdbus: annotate printf-like functions as accepting format
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DUVFCWMIP7CAZ6PQZNKTOHZOQO24Z5X3/>
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
