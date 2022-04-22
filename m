Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DFD50B587
	for <lists+linux-nfc@lfdr.de>; Fri, 22 Apr 2022 12:48:14 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id F100F100F3FCC;
	Fri, 22 Apr 2022 03:48:12 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E4E70100F3FA7
	for <linux-nfc@lists.01.org>; Fri, 22 Apr 2022 03:48:10 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id t25so9922532edt.9
        for <linux-nfc@lists.01.org>; Fri, 22 Apr 2022 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VAsRRop2pV4ZTVr7B5XC8yRu2f0AvXYEM5JlYoO6X9I=;
        b=URZruV4HFT/3ZB49dataOpdWp/YjepectaxFEsx8rweDlxosoE4tVP+E+rUiVnMdGV
         i51YYXsxvl88T3vQqFVrxfEx7np289ASHG93+1q/tkkae9AA0GWtHSzh9rP2Ivu/4feq
         qtPTiHclnsOwxPNged/45qXsprx3VrGebUUfZOYCi2xnjVFsnSEtZXeym7Zzin0rbSz0
         bsX5z6zIKfOCZG5RydwoeRKdLaVs3r0Z1QeywnIrV7aIHSlAmRqGBx8ROfHMWWp+gJdv
         o/O5DSFFoCZxLv78xB7jLvOIHXnbQn3iRNgO8AuDN+emK0BwUoyZJiOckSLqNIZ1FmeE
         y4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VAsRRop2pV4ZTVr7B5XC8yRu2f0AvXYEM5JlYoO6X9I=;
        b=HhrULSek5SgzwST806SiCOG/SrJNKb7CfJPcYJNbbxRYTnpw3iIlhmdRRhEobn/grz
         sGYxLBlwIcakStiiIN97hCmF8IVq7w/6m7wdUxVStkc20MCDbXWlO/BsZudMGwHfuEat
         7W2muq/eU/pxlWyKe0pmp8B8TeTdxRWrlnlq6iXpncsTDaVl7JzIIvzEK6Iyv8+UGAzw
         QmIbmkLh4gMMW0c2KraWfD+Y1G/szwjUGH33gnEtMT7qfT+rjPDjrdiIYwJCVynOkvOo
         /WuE9ivVR9/NiSLJgwXjjpgy/ylGAwehkjiM9W0QOUS6JWGeYaa1d3ta8XOzcYJ4e11G
         vaJg==
X-Gm-Message-State: AOAM532PZGRybtDNPQlNNmq1rqmAShcVn+S6+xZgRBycJljrl1o3L4ra
	ktsYS00SYipJRtaSCT32OOO/rQ==
X-Google-Smtp-Source: ABdhPJxsOyTkFpBIBoHx5hMe4weI1kgD/ah4F3MXOPXUb1oNT1HMAUOGq/zMWhbt6QFpoJexxkjJBQ==
X-Received: by 2002:a05:6402:7d3:b0:41d:9152:cad with SMTP id u19-20020a05640207d300b0041d91520cadmr4226041edy.370.1650624488537;
        Fri, 22 Apr 2022 03:48:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z16-20020a17090665d000b006e8789e8cedsm615266ejn.204.2022.04.22.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 03:48:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vincent Cuissard <cuissard@marvell.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 22 Apr 2022 12:47:58 +0200
Message-Id: <20220422104758.64039-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: 4D5GQT6IBSH3KUKG6XZU2HQN3JJOUVCQ
X-Message-ID-Hash: 4D5GQT6IBSH3KUKG6XZU2HQN3JJOUVCQ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] nfc: nfcmrvl: spi: Fix irq_of_parse_and_map() return value
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4D5GQT6IBSH3KUKG6XZU2HQN3JJOUVCQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.

Fixes: caf6e49bf6d0 ("NFC: nfcmrvl: add spi driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is another issue to https://lore.kernel.org/all/20220422084605.2775542-1-lv.ruyi@zte.com.cn/
---
 drivers/nfc/nfcmrvl/spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index a38e2fcdfd39..01f0a08a381c 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -115,7 +115,7 @@ static int nfcmrvl_spi_parse_dt(struct device_node *node,
 	}
 
 	ret = irq_of_parse_and_map(node, 0);
-	if (ret < 0) {
+	if (!ret) {
 		pr_err("Unable to get irq, error: %d\n", ret);
 		return ret;
 	}
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
