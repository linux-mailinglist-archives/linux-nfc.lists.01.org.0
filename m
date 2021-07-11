Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4BF3C3F01
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:21:38 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4CC7B100EB85F;
	Sun, 11 Jul 2021 13:21:34 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C4062100EB83B
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:32 -0700 (PDT)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2fxD-0001a7-HF
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:21:31 +0000
Received: by mail-wm1-f71.google.com with SMTP id n37-20020a05600c3ba5b02901fe49ba3bd0so5567512wms.1
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5AQUVSZR1+vfiM7/4c/WNox/lckYa0V9MGO9qEpuQeE=;
        b=dcvfCbRC/NarKdRQVEovnpF+hBuUtXrlGqnYXjYaJ1i3yRa2xwO8q03id3+PXRfQnx
         EZsrECQ/vLOJ7q7F5DsunBvK1VCsPgx/we9QlHoJFDGwILo2PnLvTZor0dFdEW7m04TI
         P208Btcm6uUc922bg8FcVIDc9q1Ck/fJUGwMUq1AtGR4VUDR+5421RtHtWX/Moyrw5Vy
         PaI1YPNGKBTHn24qyU38EBtUy/+Ft/AtB4Q4BVNSE3VbX/k+670KVx95fRI4MPIFaFYp
         Uao6Iz5rxapalLVJBb9gxCND3tvbH2KjezxbNBzOjTXZs7bz8OMPBfG9RbazhzsJKgan
         fsEQ==
X-Gm-Message-State: AOAM533pXrtUBwtsXKhG90uysC+7R8QF5gptnkwT2OqlzDOYzQeKYhJ4
	26HtW/SvWa45aCz0vZjk6p3wz/AA6LNsFHCgU308wHc7p28Xn7JbuBQC+7PzCjl/XUtJL6QE3Wp
	GpIeILNl0GfbRlj/fwjK/LqMo1F+wvV+l0w==
X-Received: by 2002:a05:600c:4ec8:: with SMTP id g8mr10898373wmq.150.1626034890929;
        Sun, 11 Jul 2021 13:21:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpmOx1izZIsEcjEYBh3V5ERSqU5QJQcBoOVLNkmBrt+VwTxc192YdAJYfjNzgBHZEcABhmjA==
X-Received: by 2002:a05:600c:4ec8:: with SMTP id g8mr10898365wmq.150.1626034890767;
        Sun, 11 Jul 2021 13:21:30 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:34 +0200
Message-Id: <20210711202102.18094-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: LWGVT543TAGTM6OWENWDPAYLKQA4KMNT
X-Message-ID-Hash: LWGVT543TAGTM6OWENWDPAYLKQA4KMNT
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 06/34] adapter: adjust indentation of continued arguments
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/LWGVT543TAGTM6OWENWDPAYLKQA4KMNT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/adapter.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/adapter.c b/src/adapter.c
index 9c483ca28855..5a8f083a686c 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -232,7 +232,7 @@ static gboolean property_get_powered(const GDBusPropertyTable *property,
 }
 
 static void set_powered(GDBusPendingPropertySet id, dbus_bool_t powered,
-								void *data)
+			void *data)
 {
 	struct near_adapter *adapter = data;
 	int err;
@@ -284,7 +284,7 @@ static void property_set_powered(const GDBusPropertyTable *property,
 }
 
 static void append_protocols(DBusMessageIter *iter,
-					struct near_adapter *adapter)
+			     struct near_adapter *adapter)
 {
 	const char *str;
 
@@ -405,7 +405,7 @@ static DBusMessage *stop_poll_loop(DBusConnection *conn,
 }
 
 static void tag_present_cb(uint32_t adapter_idx, uint32_t target_idx,
-								int status);
+			   int status);
 
 static gboolean check_presence(gpointer user_data)
 {
@@ -453,7 +453,7 @@ static gboolean dep_timer(gpointer user_data)
 }
 
 static void tag_present_cb(uint32_t adapter_idx, uint32_t target_idx,
-								int status)
+			   int status)
 {
 	struct near_adapter *adapter;
 
@@ -704,7 +704,7 @@ static void tag_read_cb(uint32_t adapter_idx, uint32_t target_idx, int status)
 }
 
 static void device_read_cb(uint32_t adapter_idx, uint32_t target_idx,
-								int status)
+			   int status)
 {
 	struct near_adapter *adapter;
 
@@ -996,7 +996,7 @@ static gboolean execute_recv_cb(gpointer user_data)
 }
 
 static gboolean adapter_recv_event(GIOChannel *channel, GIOCondition condition,
-							gpointer user_data)
+				   gpointer user_data)
 {
 	struct near_adapter *adapter = user_data;
 	struct near_adapter_ioreq *req;
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
