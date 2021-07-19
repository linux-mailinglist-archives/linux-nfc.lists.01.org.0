Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 427F93CD324
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:24 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D8958100EB341;
	Mon, 19 Jul 2021 04:09:22 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 09A9B100EB859
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:20 -0700 (PDT)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 1D15E4060A
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692959;
	bh=gfJcgDCX+yAnsOmN2G5ktVr4v63WiwBSiQqR8GkFXMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=agP0Jm51/Ba8tJUz0srTHJlfaHay7Fzi9iNrtYrJQH0c9mSDI29jmI+pb+66Nl0LO
	 kFyRlG9VulmTulClSGvD4AgZIpcDXegt7d2nr1/fUeFma0z1NIlml+OKHQBTF/fgOF
	 /SCm5f/nnaClD53dUV2Em5Rl0qA4Ua6Qgo1n/Jd72pHoYP04M7jG2sQVPcqqysJSLk
	 5iUpU/pQLFzzjCqMxkqKUUeJ3TFaiPGSPjNUeFzh02Fv/PFJ5WeBVYmmbC2t263/Kd
	 wsywQirKPObCxA2zZIyu/x65vsGW95xxq/vBW1FV7ZHaHLJ6hcfUJg4gxdoVmMweuK
	 dCiD64Y7UP9eg==
Received: by mail-lf1-f70.google.com with SMTP id b18-20020a0565123052b029037d602924c2so3250606lfb.17
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfJcgDCX+yAnsOmN2G5ktVr4v63WiwBSiQqR8GkFXMU=;
        b=TvmFKZ7H5e2NU/d/ktcOHKdoe9eutsR44mWwRO5R5/Mf+zQ2fOKHKCgZ3vwytoGohw
         05U+EahRk/V3PPQiWHbjdPk+O8/xBLBiNzOsRUf62WmpVwaebeG7dsFHaduw+Ldg8RJ9
         JFitdMMzN5YOjEmEGGABUGnnohOnuwhXPbO3FYlglO5bkQo5LwByWYUgXUplWsoS80Eq
         GXrZ14bJodlbk+lR0d1F9J69IKjllsGmzBpLgjeMU9q3t0AoeE3XD4ifaerBad3z0FUw
         S/M355ANF1DXhLYFCvBJupXmDc66FJwcOQ4qgKDxJo8LcKCVpsKz3NLKRsSIl4piIz8Y
         UnOg==
X-Gm-Message-State: AOAM530Ah0YtRgdAPzF1qjp+vJ/D5A7igvZqKSKznlLS2M0Ih0HKqz0e
	j3VdmD0A0yXEWBUSps02DquF09g9akr7YohArKlH/TfGCJmhnIVZBDA06PzAUaQWkKPfHqGjtQ5
	8b/weVX/E+4uuJ7zzTsINCLlRJM46n3eQuw==
X-Received: by 2002:a2e:8956:: with SMTP id b22mr16660257ljk.248.1626692958371;
        Mon, 19 Jul 2021 04:09:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLKB8MevO3UZpX31Zfa829GKlz/JbjbXxb8oOcwzvpXLm6joVf2i0mLJkSOA7PgSehNckaZw==
X-Received: by 2002:a2e:8956:: with SMTP id b22mr16660250ljk.248.1626692958247;
        Mon, 19 Jul 2021 04:09:18 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:44 +0200
Message-Id: <20210719110819.27340-39-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: MT37TJZKTVI5CTLAG7MOXJTPRTNFG5XJ
X-Message-ID-Hash: MT37TJZKTVI5CTLAG7MOXJTPRTNFG5XJ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 38/73] snep-send: fix near_ndef_message memory leak
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/MT37TJZKTVI5CTLAG7MOXJTPRTNFG5XJ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The result of near_ndef_prepare_text_record() should be freed, otherwise
it leaks making ASAN and valgrind unhappy.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/snep-send.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/snep-send.c b/tools/snep-send.c
index 5bb153210d30..53f53250b1ae 100644
--- a/tools/snep-send.c
+++ b/tools/snep-send.c
@@ -91,6 +91,7 @@ int main(int argc, char *argv[])
 	frame = g_try_malloc0(frame_length);
 	if (!frame) {
 		close(fd);
+		near_ndef_msg_free(ndef);
 		near_error("Could not allocate SNEP frame");
 		return -1;
 	}
@@ -100,6 +101,7 @@ int main(int argc, char *argv[])
 	frame->length = GUINT_TO_BE(ndef->length);
 
 	memcpy(frame->ndef, ndef->data, ndef->length);
+	near_ndef_msg_free(ndef);
 
 	len = send(fd, (uint8_t *)frame, frame_length, 0);
 	if (len < 0) {
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
