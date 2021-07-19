Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4521B3CD33E
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:54 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E711B100EAB48;
	Mon, 19 Jul 2021 04:09:52 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 49619100EB34A
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:50 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 4C725408B2
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692989;
	bh=SHo4mDP7wki8jdgJApqVRTAXpH+B37C4ye1ZAl5WI3U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=PPXM9z8h579Lj2c7aoCedwp0V5520sScjragqvqFsZlzxJE0FG2HWLSvOK/YFxdCE
	 r8/dTRm0pnhVni9UlKQi21elaI1SmCyvWBQfAlH9k2tBRqXlFHi6q0/LlFCHuolt3J
	 w2UY5UJYXc29EUgkn2wQXoyjyg9CmVGcnh7DTG+ojSWcHWr5x7rpfhukAyOnQz4TgY
	 1YMpKgi52aYYnJPh5sg16Fx+JdNDxpxGNpVYQSW9cDqSrQTPblhmp/2qZpTaY0kP4V
	 eQYbQBZzlA5LV/GYYEqquKn8BTMlUjK5lkgZzz6mtJg9ipg2p6rHmLOsV9n6T7iHaA
	 xZx7W1ieRjKbA==
Received: by mail-lf1-f71.google.com with SMTP id y10-20020ac255aa0000b0290374e0ce9d3eso3249204lfg.20
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SHo4mDP7wki8jdgJApqVRTAXpH+B37C4ye1ZAl5WI3U=;
        b=DAU4NZWx/9bVDtYSWgFvJ7sR/7f+h5ohTIoflPj5qybCegJbIAbM4As0tKCp2PuESP
         B/1+o2lTLutPciUkpf4hm9no74Kv4RcQCgWYPm8Cfdc/MK79HSb0ZAOJFgFYMIcBoDLR
         ctX5wbnN+EPnCsBaXU/uLo7hWUnGoTnw+tCFSe50KljpWOTec3fxF+Ew3xYPh05u35BF
         GzfP9OKRKkdCsIEqvYWNJQTXxLQfNo3hSicCFfnGuq/TQeGAwwKc7xFDxuBG3L2fC+Ke
         t2QOx6DF5eDV0ZKj0WuLZqNnayTb9CMHnW2N6LsMGpZ2Nz+p4zvY1QdeS0EPAEt1fU5S
         Fj6A==
X-Gm-Message-State: AOAM531o95sHXHvIgCKBH7loMIE8/l3c3qr+1ghFfbtNnvHeHVqC5YXj
	/jQIClXXL/OVHL4y7fdVsvnBodPb5BxBIbv88V2B+hvdghWXH1TyJfQHmXWNh2kSGS1nxr5eWKy
	HcG9OXeY5qOvzxFPXWufIRwyOd41DTMr5ag==
X-Received: by 2002:a05:651c:2051:: with SMTP id t17mr9146653ljo.118.1626692988457;
        Mon, 19 Jul 2021 04:09:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydW5MnTgVa2fZs8ZOicPhS2yv0hoLXpGIfx9T0YwWSlL/K5jybRUw6mr+eYn1A+6pBIvjrKw==
X-Received: by 2002:a05:651c:2051:: with SMTP id t17mr9146645ljo.118.1626692988311;
        Mon, 19 Jul 2021 04:09:48 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:09 +0200
Message-Id: <20210719110819.27340-64-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: OVS66N6D3D5R2EQTFFSNREWHU2CJBT54
X-Message-ID-Hash: OVS66N6D3D5R2EQTFFSNREWHU2CJBT54
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 63/73] unit: remove duplicated definitions in test-ndef-parse
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OVS66N6D3D5R2EQTFFSNREWHU2CJBT54/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The unit/test-ndef-parse.c duplicated several definitions which is
error-prone.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-parse.c | 109 +----------------------------------------
 1 file changed, 1 insertion(+), 108 deletions(-)

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index de3cac81b90d..53a5b584437a 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -32,114 +32,7 @@
 
 #include <near/ndef.h>
 #include <src/near.h>
-
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
- 	struct near_ndef_mime_payload *mime;
-	struct near_ndef_ho_payload   *ho;	/* handover payload */
-	struct near_ndef_aar_payload  *aar;
-
-	char *type;
-
-	uint8_t *data;
-	size_t data_len;
-};
-
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
-struct near_ndef_ac_payload {
-	enum carrier_power_state cps;	/* carrier power state */
-
-	uint8_t cdr_len;	/* carrier data reference length: 0x01 */
-	uint8_t *cdr;		/* carrier data reference */
-	uint8_t adata_refcount;	/* auxiliary data reference count */
-
-	/* !: if adata_refcount == 0, then there's no data reference */
-	uint16_t **adata;	/* auxiliary data reference */
-};
+#include <src/ndef-private.h>
 
 /* http://www.intel.com URI NDEF */
 static uint8_t test_uri[] = {0xd1, 0x1, 0xa, 0x55, 0x1, 0x69, 0x6e, 0x74,
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
