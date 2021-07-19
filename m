Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B53CD311
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:03 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 81DB2100EB32A;
	Mon, 19 Jul 2021 04:09:01 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 095EC100EBB96
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:59 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 0A2A4408B2
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692938;
	bh=5AQUVSZR1+vfiM7/4c/WNox/lckYa0V9MGO9qEpuQeE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=QGPXXXc8L17Jwh29AIVScacPHQkzHIH5vMcuujyKmPAZLiqYbN0FyPXXcwprpKgaH
	 l3HoZMK2XPmdFy4dJsfeIq/OjitZYWoYtpgArb3OKGX1C/rQrRiyc6dvqyc8efB1Qg
	 RIasFfqXVV9fIKDsgfwTDvPZUzNWcq2EqELqmQKmmm1WBgE34mlJscOXqAmqII60++
	 0Cckl1g7LfUjavH5d1+OyAVH9xy7JZixv1EZJgyyUwUQelxXe0zQhvLdX6LoZXQv13
	 /8tqknar1ReVEYGatnFGuKxJtovU6g6b8BEBlbfa58L0gwSDRuuC/o3MHRXaiH+f1b
	 +3Z9DTD7prU8A==
Received: by mail-lf1-f71.google.com with SMTP id 12-20020ac2568c0000b02903788300276eso3253418lfr.19
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5AQUVSZR1+vfiM7/4c/WNox/lckYa0V9MGO9qEpuQeE=;
        b=k9JGPsjFLGH/jqltA850ssPf8ytFqq/WtrqWISkkReh3UseKznrpNmBoqzL0gwoQNS
         RR6e6gksGJBONbLL9IxZKqC3GHf5OH0b8B85xCKtwoKTMwgI6Q9wskewU3itMkNtOA8z
         bMJf3yeKroz7ch0Q5dDu+pJ0R2U1gXbAnAY6QG1tVYNZo6YSBFU40t5F+gefDoSKRWlQ
         NAbbPumrp16vNoLagN7zKF/C3+wauv2OkLGFFN6PapzWH7CES/XCrdCTy41tPx2x4qCp
         xh+re/KZ2MeAi4/1nXRxoroXAB0VPKgFGM4zT+zebvJf+BBMbG+JGjVA6CpLFxiUjWw9
         wiRA==
X-Gm-Message-State: AOAM531WKFY7XbazkTdfjN+6ajDtxlkJNudR5t4PsGqLwmXQvD3I6K7K
	nLI0eMvW0jru5uQH+Tf3Iryf8ta8XAmtOiTzdNQMlXCMGTrzRmE+LLe/5mQ0KuNq0p/dzDmueXa
	K+skdHSZWFB1dTeDm/4e1h6olX5xveNmCIg==
X-Received: by 2002:a05:6512:3b20:: with SMTP id f32mr18315417lfv.279.1626692937291;
        Mon, 19 Jul 2021 04:08:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMGM7SNqUGTbi0FUDGK89QcOLCM6gvglbY8dh+j4I0Js4LlCC1TGP+Opcr0jXGB74eq/hQXA==
X-Received: by 2002:a05:6512:3b20:: with SMTP id f32mr18315411lfv.279.1626692937149;
        Mon, 19 Jul 2021 04:08:57 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:26 +0200
Message-Id: <20210719110819.27340-21-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 2GSHCDI5NDMAVHG62I7XQMZ4JWMMXM6Z
X-Message-ID-Hash: 2GSHCDI5NDMAVHG62I7XQMZ4JWMMXM6Z
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 20/73] adapter: adjust indentation of continued arguments
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2GSHCDI5NDMAVHG62I7XQMZ4JWMMXM6Z/>
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
