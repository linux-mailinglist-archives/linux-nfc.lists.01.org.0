Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039FA3987EB
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Jun 2021 13:20:30 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 65991100EF276;
	Wed,  2 Jun 2021 04:20:28 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B8B03100EF267
	for <linux-nfc@lists.01.org>; Wed,  2 Jun 2021 04:20:25 -0700 (PDT)
Received: from mail-ed1-f70.google.com ([209.85.208.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1loOvA-0005E8-90
	for linux-nfc@lists.01.org; Wed, 02 Jun 2021 11:20:24 +0000
Received: by mail-ed1-f70.google.com with SMTP id x8-20020aa7d3880000b029038fe468f5f4so1192111edq.10
        for <linux-nfc@lists.01.org>; Wed, 02 Jun 2021 04:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DqpBs4pq4Sjb8nYynK90LyYUsmuWivvDhwxtdT36aGM=;
        b=VBhfoQyaa/SnUwPWidwVZsjMSARV+/HwjSyF8sLn8bmW/hGge3b6TZnmR97PDee4d4
         chJbVLiYjyCDbIxxANCbLSZhhFcP8CUcE14NYPN2Am3n2U653b8O3qTBAjVI5BH5dHj3
         ogR7rYnSH8U7HtiZstF8DJ/u1Lsrqw3xXIF2SCi44V7tsHKgo6WlHD632scqRIFC4HFg
         UnsE1497vrSebueusec4PvC7fKCU9SJSBGD4IRAl4osxKSn7pr1v/BkTM/Y82R5rldYU
         2dJ4SJ4oO6LyyjrIlk+OrRX41oi0V8mV8qE+CW+nwdxTYV6kuko2AUNiEEdNP72A7L02
         GUCA==
X-Gm-Message-State: AOAM5300sNw2KS8Vm9swXKaJlXqsiFEItwN9Tvae2Y3wzXdzdeleFanN
	5rEXBAeBtHYjx2VLX7ghWvcqakmPWFtHOPdnSM5nhnqZ06TUNLVc0XWqYcFz6c0omoAPTvDscIV
	oITN9WJXbLKGsVHn2TnDxuh0go9+jE+dGdg==
X-Received: by 2002:a17:906:6dd0:: with SMTP id j16mr34042644ejt.208.1622632823960;
        Wed, 02 Jun 2021 04:20:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5uDKKjhvZNChEoO4ybm2CwDwYSd/9CN/DhLa25b0dk8xmRpWdyHyyezW0S/p4r6YRC2Iqiw==
X-Received: by 2002:a17:906:6dd0:: with SMTP id j16mr34042633ejt.208.1622632823790;
        Wed, 02 Jun 2021 04:20:23 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id jp6sm3699705ejb.85.2021.06.02.04.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 04:20:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed,  2 Jun 2021 13:20:10 +0200
Message-Id: <20210602112011.44473-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: GEW37IC6WHTZIN7537FLD3WTPS7OKCHK
X-Message-ID-Hash: GEW37IC6WHTZIN7537FLD3WTPS7OKCHK
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Joe Perches <joe@perches.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 1/2] nfc: mrvl: remove useless "continue" at end of loop
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/GEW37IC6WHTZIN7537FLD3WTPS7OKCHK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The "continue" statement at the end of a for loop does not have an
effect.  Entire loop contents can be slightly simplified to increase
code readability.  No functional change.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Make it if-else-if as Joe suggested.
---
 drivers/nfc/nfcmrvl/usb.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index bcd563cb556c..6fec20abfd1e 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -319,13 +319,9 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 		if (!drv_data->bulk_tx_ep &&
 		    usb_endpoint_is_bulk_out(ep_desc)) {
 			drv_data->bulk_tx_ep = ep_desc;
-			continue;
-		}
-
-		if (!drv_data->bulk_rx_ep &&
-		    usb_endpoint_is_bulk_in(ep_desc)) {
+		} else if (!drv_data->bulk_rx_ep &&
+			   usb_endpoint_is_bulk_in(ep_desc)) {
 			drv_data->bulk_rx_ep = ep_desc;
-			continue;
 		}
 	}
 
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
