Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB0F40285C
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:35 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1973B100EB825;
	Tue,  7 Sep 2021 05:18:31 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 49784100EBB8F
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:28 -0700 (PDT)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4533E40798
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017107;
	bh=hZ5N4zB6ne7AqKTWsazgl2eww5+7SrfSBiF0jiwRIRU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=fkzyi7n2xgRThZvtfH3XLRK+o6Zi5blyGh4ByOfRM/sSR9Cgp0Y2eDc40e84Vanzs
	 kC+WzjJtzvYxuyFUmpdqyHEKLG5TRiTAXRwcBiRPqp4RZgwVSMTIn4QmEVe8lieaOU
	 KcPfoFh1kcX6o/UkVuptmGXQTUnYIUFgjcTaZyyKkZMdEN8JyhuyjOrXKrodx4V8eC
	 qCPbbUgwQ3y/qrmL6gT+SgFm857RhIunvC8c0LFXkt/iwGqqRKORntTYAluSCXTwfB
	 RigmusWPTsxExSx7aAk56pBDbWBvHTDqB88i+U5wyL2yJUETciH47H8bmuaNMErxNz
	 NJFnfzSFLe33A==
Received: by mail-wr1-f70.google.com with SMTP id y13-20020adfe6cd000000b00159694c711dso2050945wrm.17
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hZ5N4zB6ne7AqKTWsazgl2eww5+7SrfSBiF0jiwRIRU=;
        b=lA4Z+ZVrFPcfqdzuzwBmQXMn0SE1B+Jz0B2WzJXTXsHx7Pz79smqF8wU6nVqgKR8Pf
         yl8e/8u5YIivcuwSWHx5dbFxMojZCFrFKTHqpAtdcfe5zK5GfhFyvDlAcIrau44aG9xm
         SpeoB3U0mVpjO6sCPCCly9WXgPBFYcZnR27BCoOgXdvdjD/SMkle3O6w2c68S2Fs13gJ
         rtlVF220SRHdarsLqzCFfw2gGdtUfpLOgVR4lmaCOZOqzgkEpSvvteYFZE4DXzBGGGTe
         f8RD96ZhDXFOQUPRdslCJznVgB+Hn/QhQY6dl0qetrIIVwQN6wa661nO99nVJJ6FD4Qb
         7x8A==
X-Gm-Message-State: AOAM532xRmLlFNxMBAQj3XslKh9GTHiLJVouFw7zLXh1UPrPh6LsV89o
	+Vq6lUMQyDonHgjM41xQ/g+Na1IMB7zXjESEZep8T+MKmAf9se9JkZPzXc8nRvtTxLJRF1CwTnW
	oh4YqL8wovaeP67mkxCgI47iFrbl4BnWw5Q==
X-Received: by 2002:adf:b348:: with SMTP id k8mr3883772wrd.123.1631017106986;
        Tue, 07 Sep 2021 05:18:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgbBZYQOs4YRKdywoy8M0o3zhvETIaAW/i0wBtwjAAuvZRpPDbv0ZXj/kM++iU/bcy36GOCg==
X-Received: by 2002:adf:b348:: with SMTP id k8mr3883754wrd.123.1631017106864;
        Tue, 07 Sep 2021 05:18:26 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Mark Greer <mgreer@animalcreek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Tue,  7 Sep 2021 14:18:05 +0200
Message-Id: <20210907121816.37750-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ZXPLNGYVPEWL5WCP66KXMK2QFGSHWCYB
X-Message-ID-Hash: ZXPLNGYVPEWL5WCP66KXMK2QFGSHWCYB
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 04/15] nfc: fdp: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZXPLNGYVPEWL5WCP66KXMK2QFGSHWCYB/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
index 051c43a2a52f..f78670bf41e0 100644
--- a/drivers/nfc/fdp/i2c.c
+++ b/drivers/nfc/fdp/i2c.c
@@ -335,7 +335,6 @@ static int fdp_nci_i2c_probe(struct i2c_client *client)
 		return r;
 	}
 
-	dev_dbg(dev, "I2C driver loaded\n");
 	return 0;
 }
 
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
