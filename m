Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6F13C8362
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:38 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 909E1100EB34D;
	Wed, 14 Jul 2021 04:05:33 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 9D94F100EC1EB
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:32 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id B1C8F40596
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260729;
	bh=vuxvHipAjlpPyDlVfSroyLrU4I8zV+ZPo5R1TOLojug=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=DE71Qs23B2W8++rCkREQMuYq+m/fERg1XmPfS+yATj6me0bpTCL1CJ9YbpW2GZrSJ
	 IFywx8k85ONkz3iemuAX3AfYLvuCnBipBsXZTOLetThAMDAsF88tKu8U1ui8K3dwaO
	 L/fdPBl6/7m5mC13iZsPDtrAG7jffwFTC4VOmci6rVlG9u154iW+brPPqmRYUGbOEF
	 8L9lXez/ZD95qrq2N5utYuumXxrTIJA2NryZ4ZGx3e6P2nYB4o7tbVowYR67Uggv1m
	 5Y4bMYpzcDeVzq9Ldx24tzxl6yYLbKr7zl3kalAk2qsefLL8+z+a833F8CI1c24eTS
	 4co9vhW5akRZA==
Received: by mail-ej1-f69.google.com with SMTP id jx16-20020a1709077610b02904e0a2912b46so649809ejc.7
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vuxvHipAjlpPyDlVfSroyLrU4I8zV+ZPo5R1TOLojug=;
        b=INcVy8Z1TnbFhs43CBNm8lGOrQmRsXJYxZSTWlQaSp30MIhCvfOIFdD6iZ3d1Ga8iH
         14SsBmPOzKJjzq4y/SICrvmrLBGFewyntbrM5pUwYWWcS3hR9D8mXDE6rULvmD0itNQT
         nSEvpivUV01Txaf1qE2k7nENDBl1i0mveXDyo2nJbd2JccvcWJ7/Kfw9dgGX5Bla54/q
         1nUKKOA41JEptMucDMlt9mhrI4bfOeQBiOURXocQFnxFZBc9JXlCQNlUPjUtQQoafQdy
         t3k5fUfh/A7e68N9dnL1nueqK+N+gEwYo9q12KfRhVBJSXLZxpRvjFRPL4F0webiPWn1
         4vag==
X-Gm-Message-State: AOAM5305aP96NKXitHKkngf+zpOj2LG/te62obsYZkJIJix/9fEwqNjy
	goHodZSj8eKxK5MYInZhIOCl1Digfp3AdQT7Pj9b/GUjA7z9cnwD4zKhcZyTdmlFi/vN8p9QuEC
	u1pXW7WKzwuow9Hb9Zm65mNlFOuf7CJq63w==
X-Received: by 2002:a17:906:a18b:: with SMTP id s11mr11940679ejy.8.1626260729011;
        Wed, 14 Jul 2021 04:05:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMUOpVh9oLcRQJSiuVvDLVDXEWsFMgTMar41OiS+DOlPMT713FJFEzmMSH/CH6d9Uj3mgWvQ==
X-Received: by 2002:a17:906:a18b:: with SMTP id s11mr11940642ejy.8.1626260728700;
        Wed, 14 Jul 2021 04:05:28 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:05 +0200
Message-Id: <20210714110518.104655-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: DLOLTYUBS5UTXU73SI2MV357DW4GOQBJ
X-Message-ID-Hash: DLOLTYUBS5UTXU73SI2MV357DW4GOQBJ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 03/16] mifare: use unsigned int to suppress compiler -Wstrict-overflow
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DLOLTYUBS5UTXU73SI2MV357DW4GOQBJ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

GCC v7.5 (Ubuntu Bionic) with optimizations has trouble spotting lack of
possible overflow of a signed integer.  There is no overflow possible
so this is a false positive which can be suppressed by simply using
unsigned integer.  Unsigned also has more sense in that context.

This fixes GCC 7.5 warning:

    plugins/mifare.c: In function 'mifare_process_MADs':
    plugins/mifare.c:626:5: error: assuming signed overflow does not occur when simplifying conditional to constant [-Werror=strict-overflow]
      if (global_tag_size == 0) {
         ^

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 plugins/mifare.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/plugins/mifare.c b/plugins/mifare.c
index a4e4ba443995..f42007d5dfd7 100644
--- a/plugins/mifare.c
+++ b/plugins/mifare.c
@@ -560,7 +560,7 @@ static int mifare_process_MADs(void *data)
 	struct mifare_cookie *mf_ck = data;
 	int err;
 	int i;
-	int global_tag_size = 0;
+	unsigned int global_tag_size = 0;
 	int ioffset;
 	uint8_t *tag_data;
 	size_t data_size;
@@ -626,13 +626,13 @@ done_mad:
 	if (global_tag_size == 0) {
 
 		/* no NFC sectors - mark tag as blank */
-		near_error("TAG Global size: [%d], not valid NFC tag.",
+		near_error("TAG Global size: [%u], not valid NFC tag.",
 				global_tag_size);
 		return -ENODEV;
 	}
 
 	/* n sectors, each sector is 3 blocks, each block is 16 bytes */
-	DBG("TAG Global size: [%d]", global_tag_size);
+	DBG("TAG Global size: [%u]", global_tag_size);
 
 	mf_ck->tag = near_tag_get_tag(mf_ck->adapter_idx, mf_ck->target_idx);
 	if (!mf_ck->tag) {
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
