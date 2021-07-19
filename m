Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EE13CD33D
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:53 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C41A9100F2275;
	Mon, 19 Jul 2021 04:09:51 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 13619100F227A
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:49 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 22DD040207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692988;
	bh=A38x9ZtnzCCJ72av7g8ps35GlA9X1BPt7/cpFCGHWa4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=YlId+pePmEl0HEdqHpPUytSKVwMwnFp/fFu7KR3Cwe8f0G5eywIMdu00oKxghbOqP
	 p6BuXco5HIP3nUqzgGApHIglwocl7vx5FhJj1z4iLZwXtRlW8UVaVYzIP9klFik/zl
	 kldU0AoVpQyQUKF0JzCdOxcvwS/5we04w4d3MBbjREnD3d4i5xtdggYsMpdOuyFR7c
	 iryqFTVeww4h/WgbPIQ73AUaSQ6t2223vZxed1FQER5WY1uLhyWRbtBvMvVIdUIS25
	 5YhAjH97oaJ/RpsNUmA3WuxJCIoFKXW/u0L9fhXXhAe40exT6INP+UMqZLb2FEmQut
	 jFLX5rtNkEtUw==
Received: by mail-lj1-f200.google.com with SMTP id e9-20020a2e98490000b029018c799ba37bso9288283ljj.6
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A38x9ZtnzCCJ72av7g8ps35GlA9X1BPt7/cpFCGHWa4=;
        b=uASXfC+XL3RJD/SqY9Dd1WDqzanaA6kCN2f5UTSdykoboVbiYeqtR99AQvj0zykLWo
         NqRYNI/rNukcx1xhTlMr9NpRnoQFfBTK8JCbshmKodNMOG1gQR8gi8OOMvn/wJ+bXaGR
         ThCNcpeT8C6VbSp19KB2IMRxpOzWSgvp0Lvs7Yp/lotshkFAUrDvCSeMAdaqvLt/Ht2+
         oe7EaHuFUOLbHw8QnlQijwFX9T4Tuu7HBhnq+JN5YybGEgAjEd9EZ5FLtQgHaJ0ntQsS
         5vY4HU+xsJtZ7chxG/ZQb8/eyM+KLkwHjjls5d9SUDt1t129EH2Z3NfxrNKJOIVeEW+9
         MBiA==
X-Gm-Message-State: AOAM530fXOyBa0kQ5khUM8P7Ls+vVfDeXoCY3DjzlVmY+mPtxEZMvlAL
	GwqRI4+H9uLVLQP+qOqnbVl8W+k/iuKhZ/v95QCZDYYdo1IUjsTp4SJL1ftP/6MZ6+u1lX4TWIj
	LSxMNDkaI68phfgWUDgx2ZpHWVwKv8dAW7A==
X-Received: by 2002:a2e:503:: with SMTP id 3mr22022451ljf.234.1626692987351;
        Mon, 19 Jul 2021 04:09:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWsvt8aWQHlMTXq3r2jMjtszdUPlfWp3u0b4odFIjJpNGOYWkGL3fSG1noBt7w3l41yRH1/w==
X-Received: by 2002:a2e:503:: with SMTP id 3mr22022444ljf.234.1626692987137;
        Mon, 19 Jul 2021 04:09:47 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:08 +0200
Message-Id: <20210719110819.27340-63-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: DY4X5UHKLGPA6M7M7SUT5GILYFSL76XP
X-Message-ID-Hash: DY4X5UHKLGPA6M7M7SUT5GILYFSL76XP
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 62/73] unit: remove duplicated invalid definitions in test-snep-read
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DY4X5UHKLGPA6M7M7SUT5GILYFSL76XP/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The unit tests duplicated several definitions in unit/test-utils.h which
after some time become outdated and not matching the original ones.
This lead to bogus data printed in logs, for example length of
near_ndef_record:

    [SNEP unit]	dummy_req_put STORED REC data=0x55ceb3fc8050 length=94346271294192

Move all of them into new src/ndef-private.h header.  Start using SPDX
identifier instead of full GPL license boilerplate.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Makefile.am           |   2 +-
 src/ndef-private.h    | 140 ++++++++++++++++++++++++++++++++++++++++++
 src/ndef.c            | 137 +----------------------------------------
 unit/test-snep-read.c |   2 +
 unit/test-utils.h     |  81 +-----------------------
 5 files changed, 145 insertions(+), 217 deletions(-)
 create mode 100644 src/ndef-private.h

diff --git a/Makefile.am b/Makefile.am
index fa552ee38f98..26aa4ca82e80 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -37,7 +37,7 @@ pkglibexecdir = ${libexecdir}/nfc
 pkglibexec_PROGRAMS = src/neard
 
 src_neard_SOURCES = $(gdbus_sources) $(gweb_sources) $(builtin_sources) \
-			src/main.c src/error.c src/near.h src/log.c \
+			src/main.c src/error.c src/ndef-private.h src/near.h src/log.c \
 			src/dbus.c src/manager.c src/adapter.c src/device.c \
 			src/tag.c src/plugin.c src/netlink.c src/ndef.c \
 			src/tlv.c src/bluetooth.c src/agent.c src/snep.c
diff --git a/src/ndef-private.h b/src/ndef-private.h
new file mode 100644
index 000000000000..08a928e0cfbe
--- /dev/null
+++ b/src/ndef-private.h
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2011-2016  Intel Corporation. All rights reserved.
+ * Copyright (c) 2021 Canonical Ltd.
+ */
+
+enum record_type {
+	RECORD_TYPE_WKT_SMART_POSTER          =   0x01,
+	RECORD_TYPE_WKT_URI                   =   0x02,
+	RECORD_TYPE_WKT_TEXT                  =   0x03,
+	RECORD_TYPE_WKT_SIZE                  =   0x04,
+	RECORD_TYPE_WKT_TYPE                  =   0x05,
+	RECORD_TYPE_WKT_ACTION                =   0x06,
+	RECORD_TYPE_WKT_HANDOVER_REQUEST      =   0x07,
+	RECORD_TYPE_WKT_HANDOVER_SELECT       =   0x08,
+	RECORD_TYPE_WKT_HANDOVER_CARRIER      =   0x09,
+	RECORD_TYPE_WKT_ALTERNATIVE_CARRIER   =   0x0a,
+	RECORD_TYPE_WKT_COLLISION_RESOLUTION  =   0x0b,
+	RECORD_TYPE_WKT_ERROR                 =   0x0c,
+	RECORD_TYPE_MIME_TYPE                 =   0x0d,
+	RECORD_TYPE_EXT_AAR                   =   0x0e,
+	RECORD_TYPE_UNKNOWN                   =   0xfe,
+	RECORD_TYPE_ERROR                     =   0xff
+};
+
+#define RECORD_TYPE_WKT "urn:nfc:wkt:"
+#define RECORD_TYPE_EXTERNAL "urn:nfc:ext:"
+#define AAR_STRING "android.com:pkg"
+
+struct near_ndef_record_header {
+	uint8_t mb;
+	uint8_t me;
+	uint8_t cf;
+	uint8_t sr;
+	uint8_t il;
+	uint8_t tnf;
+	uint8_t il_length;
+	uint8_t *il_field;
+	uint32_t payload_len;
+	uint32_t offset;
+	uint8_t	type_len;
+	enum record_type rec_type;
+	char *type_name;
+	uint32_t header_len;
+};
+
+struct near_ndef_text_payload {
+	char *encoding;
+	char *language_code;
+	char *data;
+};
+
+struct near_ndef_uri_payload {
+	uint8_t identifier;
+
+	uint32_t  field_length;
+	uint8_t  *field;
+};
+
+struct near_ndef_sp_payload {
+	struct near_ndef_uri_payload *uri;
+
+	uint8_t number_of_title_records;
+	struct near_ndef_text_payload **title_records;
+
+	uint32_t size; /* from Size record*/
+	char *type;    /* from Type record*/
+	char *action;
+	/* TODO add icon and other records fields*/
+};
+
+struct near_ndef_mime_payload {
+	char *type;
+
+	struct {
+		enum handover_carrier carrier_type;
+		uint16_t properties;	/* e.g.: NO_PAIRING_KEY */
+	} handover;
+	uint8_t *payload;
+	uint32_t payload_len;
+};
+
+/* Handover record definitions */
+
+/* alternative record (AC) length based on cdr length without adata */
+#define AC_RECORD_PAYLOAD_LEN(cdr_len) (3 + cdr_len)
+
+struct near_ndef_ac_payload {
+	enum carrier_power_state cps;	/* carrier power state */
+
+	uint8_t cdr_len;	/* carrier data reference length */
+	uint8_t *cdr;		/* carrier data reference */
+	uint8_t adata_refcount;	/* auxiliary data reference count */
+
+	/* !: if adata_refcount == 0, then there's no data reference */
+	uint16_t **adata;	/* auxiliary data reference */
+};
+
+/* Default Handover version */
+#define HANDOVER_VERSION	0x12
+#define HANDOVER_MAJOR(version) (((version) >> 4) & 0xf)
+#define HANDOVER_MINOR(version) ((version) & 0xf)
+
+/* General Handover Request/Select record */
+struct near_ndef_ho_payload {
+	uint8_t version;		/* version id */
+	uint16_t collision_record;	/* collision record */
+
+	uint8_t number_of_ac_payloads;	/* At least 1 ac is needed */
+	struct near_ndef_ac_payload **ac_payloads;
+
+	/* Optional records */
+	uint16_t *err_record;	/* not NULL if present */
+
+	uint8_t number_of_cfg_payloads;	/* extra NDEF records */
+	struct near_ndef_mime_payload **cfg_payloads;
+};
+
+struct near_ndef_aar_payload {
+	char *package;
+};
+
+struct near_ndef_record {
+	char *path;
+
+	struct near_ndef_record_header *header;
+
+	/* specific payloads */
+	struct near_ndef_text_payload *text;
+	struct near_ndef_uri_payload  *uri;
+	struct near_ndef_sp_payload   *sp;
+	struct near_ndef_mime_payload *mime;
+	struct near_ndef_ho_payload   *ho;	/* handover payload */
+	struct near_ndef_aar_payload  *aar;
+
+	char *type;
+
+	uint8_t *data;
+	size_t data_len;
+};
diff --git a/src/ndef.c b/src/ndef.c
index 0215bba0f3ae..f26e6746181d 100644
--- a/src/ndef.c
+++ b/src/ndef.c
@@ -34,6 +34,7 @@
 #include <gdbus.h>
 
 #include "near.h"
+#include "ndef-private.h"
 
 enum record_tnf {
 	RECORD_TNF_EMPTY     = 0x00,
@@ -78,142 +79,6 @@ enum record_tnf {
 
 #define AC_CPS_MASK 0x03
 
-enum record_type {
-	RECORD_TYPE_WKT_SMART_POSTER          =   0x01,
-	RECORD_TYPE_WKT_URI                   =   0x02,
-	RECORD_TYPE_WKT_TEXT                  =   0x03,
-	RECORD_TYPE_WKT_SIZE                  =   0x04,
-	RECORD_TYPE_WKT_TYPE                  =   0x05,
-	RECORD_TYPE_WKT_ACTION                =   0x06,
-	RECORD_TYPE_WKT_HANDOVER_REQUEST      =   0x07,
-	RECORD_TYPE_WKT_HANDOVER_SELECT       =   0x08,
-	RECORD_TYPE_WKT_HANDOVER_CARRIER      =   0x09,
-	RECORD_TYPE_WKT_ALTERNATIVE_CARRIER   =   0x0a,
-	RECORD_TYPE_WKT_COLLISION_RESOLUTION  =   0x0b,
-	RECORD_TYPE_WKT_ERROR                 =   0x0c,
-	RECORD_TYPE_MIME_TYPE                 =   0x0d,
-	RECORD_TYPE_EXT_AAR                   =   0x0e,
-	RECORD_TYPE_UNKNOWN                   =   0xfe,
-	RECORD_TYPE_ERROR                     =   0xff
-};
-
-#define RECORD_TYPE_WKT "urn:nfc:wkt:"
-#define RECORD_TYPE_EXTERNAL "urn:nfc:ext:"
-#define AAR_STRING "android.com:pkg"
-
-struct near_ndef_record_header {
-	uint8_t mb;
-	uint8_t me;
-	uint8_t cf;
-	uint8_t sr;
-	uint8_t il;
-	uint8_t tnf;
-	uint8_t il_length;
-	uint8_t *il_field;
-	uint32_t payload_len;
-	uint32_t offset;
-	uint8_t	type_len;
-	enum record_type rec_type;
-	char *type_name;
-	uint32_t header_len;
-};
-
-struct near_ndef_text_payload {
-	char *encoding;
-	char *language_code;
-	char *data;
-};
-
-struct near_ndef_uri_payload {
-	uint8_t identifier;
-
-	uint32_t  field_length;
-	uint8_t  *field;
-};
-
-struct near_ndef_sp_payload {
-	struct near_ndef_uri_payload *uri;
-
-	uint8_t number_of_title_records;
-	struct near_ndef_text_payload **title_records;
-
-	uint32_t size; /* from Size record*/
-	char *type;    /* from Type record*/
-	char *action;
-	/* TODO add icon and other records fields*/
-};
-
-struct near_ndef_mime_payload {
-	char *type;
-
-	struct {
-		enum handover_carrier carrier_type;
-		uint16_t properties;	/* e.g.: NO_PAIRING_KEY */
-	} handover;
-	uint8_t *payload;
-	uint32_t payload_len;
-};
-
-/* Handover record definitions */
-
-/* alternative record (AC) length based on cdr length without adata */
-#define AC_RECORD_PAYLOAD_LEN(cdr_len) (3 + cdr_len)
-
-struct near_ndef_ac_payload {
-	enum carrier_power_state cps;	/* carrier power state */
-
-	uint8_t cdr_len;	/* carrier data reference length */
-	uint8_t *cdr;		/* carrier data reference */
-	uint8_t adata_refcount;	/* auxiliary data reference count */
-
-	/* !: if adata_refcount == 0, then there's no data reference */
-	uint16_t **adata;	/* auxiliary data reference */
-};
-
-/* Default Handover version */
-#define HANDOVER_VERSION	0x12
-#define HANDOVER_MAJOR(version) (((version) >> 4) & 0xf)
-#define HANDOVER_MINOR(version) ((version) & 0xf)
-
-
-/* General Handover Request/Select record */
-struct near_ndef_ho_payload {
-	uint8_t version;		/* version id */
-	uint16_t collision_record;	/* collision record */
-
-	uint8_t number_of_ac_payloads;	/* At least 1 ac is needed */
-	struct near_ndef_ac_payload **ac_payloads;
-
-	/* Optional records */
-	uint16_t *err_record;	/* not NULL if present */
-
-	uint8_t number_of_cfg_payloads;	/* extra NDEF records */
-	struct near_ndef_mime_payload **cfg_payloads;
-};
-
-struct near_ndef_aar_payload {
-	char *package;
-};
-
-struct near_ndef_record {
-	char *path;
-
-	struct near_ndef_record_header *header;
-
-	/* specific payloads */
-	struct near_ndef_text_payload *text;
-	struct near_ndef_uri_payload  *uri;
-	struct near_ndef_sp_payload   *sp;
-	struct near_ndef_mime_payload *mime;
-	struct near_ndef_ho_payload   *ho;	/* handover payload */
-	struct near_ndef_aar_payload  *aar;
-
-	char *type;
-
-	uint8_t *data;
-	size_t data_len;
-};
-
 static DBusConnection *connection = NULL;
 
 static inline void fillb8(uint8_t *ptr, uint32_t len)
diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index ea41ae03a8b2..21be58785eda 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -35,6 +35,8 @@
 
 #include <near/types.h>
 
+#include <src/near.h>
+#include <src/ndef-private.h>
 #include "test-utils.h"
 
 #define TEST_SNEP_LOG(fmt, ...) do { \
diff --git a/unit/test-utils.h b/unit/test-utils.h
index 108f2a1fb139..6d434f43cb2d 100644
--- a/unit/test-utils.h
+++ b/unit/test-utils.h
@@ -28,8 +28,7 @@
 #include <string.h>
 #include <unistd.h>
 
-#include <src/near.h>
-#include <near/nfc_copy.h>
+#include <near/device.h>
 #include <near/types.h>
 #include <near/ndef.h>
 #include <glib.h>
@@ -65,84 +64,6 @@ struct p2p_snep_resp_frame {
 	uint8_t info[];
 } __attribute__((packed));
 
-/* NDEF specific types */
-enum record_type {
-	RECORD_TYPE_WKT_SMART_POSTER          =   0x01,
-	RECORD_TYPE_WKT_URI                   =   0x02,
-	RECORD_TYPE_WKT_TEXT                  =   0x03,
-	RECORD_TYPE_WKT_SIZE                  =   0x04,
-	RECORD_TYPE_WKT_TYPE                  =   0x05,
-	RECORD_TYPE_WKT_ACTION                =   0x06,
-	RECORD_TYPE_WKT_HANDOVER_REQUEST      =   0x07,
-	RECORD_TYPE_WKT_HANDOVER_SELECT       =   0x08,
-	RECORD_TYPE_WKT_HANDOVER_CARRIER      =   0x09,
-	RECORD_TYPE_WKT_ALTERNATIVE_CARRIER   =   0x0a,
-	RECORD_TYPE_WKT_COLLISION_RESOLUTION  =   0x0b,
-	RECORD_TYPE_WKT_ERROR                 =   0x0c,
-	RECORD_TYPE_MIME_TYPE                 =   0x0d,
-	RECORD_TYPE_UNKNOWN                   =   0xfe,
-	RECORD_TYPE_ERROR                     =   0xff
-};
-
-struct near_ndef_record_header {
-	uint8_t mb;
-	uint8_t me;
-	uint8_t cf;
-	uint8_t sr;
-	uint8_t il;
-	uint8_t tnf;
-	uint8_t il_length;
-	uint8_t *il_field;
-	uint32_t payload_len;
-	uint32_t offset;
-	uint8_t	type_len;
-	enum record_type rec_type;
-	char *type_name;
-	uint32_t header_len;
-};
-
-struct near_ndef_text_payload {
-	char *encoding;
-	char *language_code;
-	char *data;
-};
-
-struct near_ndef_uri_payload {
-	uint8_t identifier;
-
-	uint32_t  field_length;
-	uint8_t  *field;
-};
-
-struct near_ndef_sp_payload {
-	struct near_ndef_uri_payload *uri;
-
-	uint8_t number_of_title_records;
-	struct near_ndef_text_payload **title_records;
-
-	uint32_t size; /* from Size record*/
-	char *type;    /* from Type record*/
-	char *action;
-};
-
-struct near_ndef_record {
-	char *path;
-
-	struct near_ndef_record_header *header;
-
-	/* specific payloads */
-	struct near_ndef_text_payload *text;
-	struct near_ndef_uri_payload  *uri;
-	struct near_ndef_sp_payload   *sp;
-	struct near_ndef_mime_payload *mime;
-	struct near_ndef_ho_payload   *ho;	/* handover payload */
-
-	char *type;
-
-	uint8_t *data;
-	size_t data_len;
-};
-
 struct near_ndef_message *test_ndef_create_test_record(const char *str);
 
 #endif
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
