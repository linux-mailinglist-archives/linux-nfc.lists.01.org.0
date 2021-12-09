Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B5D46E3E1
	for <lists+linux-nfc@lfdr.de>; Thu,  9 Dec 2021 09:13:15 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9771A100EAB0E;
	Thu,  9 Dec 2021 00:13:13 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0DC6F100EBBCB
	for <linux-nfc@lists.01.org>; Thu,  9 Dec 2021 00:13:11 -0800 (PST)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DC1043F1BA
	for <linux-nfc@lists.01.org>; Thu,  9 Dec 2021 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1639037589;
	bh=li++Q1lkbhIYARBNYivAD9l31K5a4noYe2Z2qkyrMDA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=OnUBjr8J0of7aq5VvS+nGLcZJAwuRgInZNSw0K9G1/yekR6fDocUXPHv4yWegdlwp
	 2ZlpBnO1lhk4vhWIfHXLLdxrbEtPIJ5XQLxUZtMBliryKHx4mU3O5T8XD9eInFxgge
	 vNOx5EAu4jEwLU1hNIcdJ3+oIL2xAa7S/j3avybKT5iWteYTsDG14WiOYM6AMUzxbi
	 HcL1Oqo4c0ROt7tUmueVSSiXIBM+tCTwO/mH2nODUSIc58mL/u4PoSP4Y8KxtJ7hKU
	 YEJIJXCqk4Gx1/CrNWP+NClZ44TM+ONgxUthpNzFXIyI3okBKZ1dqwE+AnSI+YH0XY
	 9L8rfYbMrW5Og==
Received: by mail-lf1-f71.google.com with SMTP id e23-20020a196917000000b0041bcbb80798so2339658lfc.3
        for <linux-nfc@lists.01.org>; Thu, 09 Dec 2021 00:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=li++Q1lkbhIYARBNYivAD9l31K5a4noYe2Z2qkyrMDA=;
        b=M1MxuBCVDBH2CkoIDe2sc3Sk2RU6ho2RiPuiH8/ODhZ7PtPHACJzhtUwlJogy0hp0B
         CGM9BUAxf+FpO3AXijcbC00nbNNEnWpYyL+9QV2f1aiPEES0kqHF26WIXkPBpHGYq8qA
         wrY1igN8V/Z22fl8weW7HUVWJLJr0A32+/tEYyF0UQn7CB5a1JgPCp87S3SvO3M95Y6v
         okkLnxYrlTg5txQmT+3Fdyaug7GfGexDT4lCYvG7ML5TNV6jILemxDeJBKVDWyCUPycN
         +ZKQOs7DewCregHXp9xKuY41i5tnCPqz3Doj5tXfvE6UFdlc6KPTNHvXuPk8xSN5z47J
         DLEQ==
X-Gm-Message-State: AOAM533XnV1kMFTmIOd9o+6biD4Zc3fTbalJdccc7+Wg7SYGR7Tlynj0
	Y0RomY5kwforNhuvg9VD1xbA3ikvrx3aU8iMmkdLnPnELdlpUBUsFVbhL1u5FqcdwFsKQCC5cnh
	G/AL3Y7ztKVQD+VrZOyfn6m26/tEid/BEYw==
X-Received: by 2002:a05:6512:3082:: with SMTP id z2mr4516786lfd.351.1639037589283;
        Thu, 09 Dec 2021 00:13:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxew4i4a9DoT8yTaM1mSJukQJbcgVSv8A/a2FaL4870WYGHn9oTdN4j+N4jiTVK5QQzEioo6A==
X-Received: by 2002:a05:6512:3082:: with SMTP id z2mr4516767lfd.351.1639037589089;
        Thu, 09 Dec 2021 00:13:09 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s5sm531144ljg.3.2021.12.09.00.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 00:13:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Thu,  9 Dec 2021 09:13:07 +0100
Message-Id: <20211209081307.57337-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: NKYMX6H2WRNIKN2FGKE73LWS3LE2UZLX
X-Message-ID-Hash: NKYMX6H2WRNIKN2FGKE73LWS3LE2UZLX
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: tadeusz.struk@linaro.org, stable@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] nfc: fix potential NULL pointer deref in nfc_genl_dump_ses_done
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/NKYMX6H2WRNIKN2FGKE73LWS3LE2UZLX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The done() netlink callback nfc_genl_dump_ses_done() should check if
received argument is non-NULL, because its allocation could fail earlier
in dumpit() (nfc_genl_dump_ses()).

Fixes: ac22ac466a65 ("NFC: Add a GET_SE netlink API")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/netlink.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 334f63c9529e..5c706ed75b33 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1392,8 +1392,10 @@ static int nfc_genl_dump_ses_done(struct netlink_callback *cb)
 {
 	struct class_dev_iter *iter = (struct class_dev_iter *) cb->args[0];
 
-	nfc_device_iter_exit(iter);
-	kfree(iter);
+	if (iter) {
+		nfc_device_iter_exit(iter);
+		kfree(iter);
+	}
 
 	return 0;
 }
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
