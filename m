Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C182428E33
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Oct 2021 15:39:26 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4A146100F3FB2;
	Mon, 11 Oct 2021 06:39:23 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id EA9B2100F3FA6
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:39:21 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C3FF43FFF5
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633959560;
	bh=JDWMUU6nWDzDRnCxtysvffFNd9O3HT0+eb4C8TwA21k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=HMylaOGmTSbz9pQO+s0aqSEhtjb5N4SH2aSAPXh3p8KdGVc5ChJcrvH9C/5Cb8y6n
	 gWKRpU3EjNtZfaZyqs0ff1pbrKyfKYNWTTdNbJ2zwvn4MdnFmRzJPJXlEOwE723rbm
	 NYz8m1W0dfePPzFaC8T4sRPFFSq9xFbRN64IbMeYb3YXmg7F4JdmuItgcvPtNNB/vm
	 jcxwUVP03+Pxy/efYBGJEYD9qItgRMN+A6rE3ABQ5XjY5B9NvBVWOHPeHDrGdTOV+d
	 VMz/43IBifuGQMV31IpfxH4wCgWv/KRe0h7sQZLBBdQ57b8GYtnI2Sgio4Y/emz2Ex
	 wOW1LEDRhV0DA==
Received: by mail-lf1-f71.google.com with SMTP id k8-20020a0565123d8800b003fd6e160c77so7894495lfv.17
        for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JDWMUU6nWDzDRnCxtysvffFNd9O3HT0+eb4C8TwA21k=;
        b=1nh7fX4gVsC66ptbJJ6xrZKeOUeLeHg1G5WxtckpOvfT3PM9SjqFSJL4K9JYaAoV0B
         sbxqEzYYXf/KXdvh3Ja9ywELd6kCjBvPKC3wAkaS6t3HBYxJaiLenDrLllpNUB8BX/mX
         PLPW6OrucH4lbnepCIobzVdwYCMwtQ4vp4gxR5iz1O1QtKABYv56bochzkjae9ejHzo7
         3cCrz14A99glZT5DM6AaVoALFSLghH5vi9+jKSFTWkxm04F/vmzFF5QXVkxodmyDVGyA
         XpZB4/4vHmoE4OP80SS2IQkga+jIJckiuuew2PFmLIQqjNcuQJKwoybzkA2NTyLaAZtq
         QVlQ==
X-Gm-Message-State: AOAM531/J+aphmNxB/hgWuLYpMu7Z+4iWAbbsIyNa1mM5OaHAo76iwdX
	Ivk3Yz/tQptzY48QEpQ1DMB27KKug8Gjk4W99zs4R7PFD/VajJ437n0j77EVn8M+sb6u6G77mlF
	ntr/sZ2chi2t9Z/rTsBrHKmX+rcGDmJja0g==
X-Received: by 2002:a2e:8e34:: with SMTP id r20mr20853455ljk.333.1633959560185;
        Mon, 11 Oct 2021 06:39:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRz7DpdQcBJRmnueBTrOi1zNkscgrQZOrzwADl158XzSPie8WujbquNwjd0Wgme+4+/OOnZQ==
X-Received: by 2002:a2e:8e34:: with SMTP id r20mr20853437ljk.333.1633959560014;
        Mon, 11 Oct 2021 06:39:20 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a21sm738971lff.37.2021.10.11.06.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 06:39:19 -0700 (PDT)
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
Date: Mon, 11 Oct 2021 15:38:31 +0200
Message-Id: <20211011133835.236347-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
References: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 5NRCIP6VBS33FCFLG4YFTVYLTU2FWKTN
X-Message-ID-Hash: 5NRCIP6VBS33FCFLG4YFTVYLTU2FWKTN
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: joe@perches.com
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 3/7] nfc: s3fwrn5: simplify dereferencing pointer to struct device
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5NRCIP6VBS33FCFLG4YFTVYLTU2FWKTN/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Simplify the code dereferencing several pointers to reach the struct
device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/s3fwrn5/firmware.c | 29 +++++++++++------------------
 drivers/nfc/s3fwrn5/nci.c      | 18 +++++++-----------
 2 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 1af7a1e632cf..c20fdbac51c5 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -357,6 +357,7 @@ s3fwrn5_fw_is_custom(const struct s3fwrn5_fw_cmd_get_bootinfo_rsp *bootinfo)
 
 int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info)
 {
+	struct device *dev = &fw_info->ndev->nfc_dev->dev;
 	struct s3fwrn5_fw_cmd_get_bootinfo_rsp bootinfo;
 	int ret;
 
@@ -364,8 +365,7 @@ int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info)
 
 	ret = s3fwrn5_fw_get_bootinfo(fw_info, &bootinfo);
 	if (ret < 0) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Failed to get bootinfo, ret=%02x\n", ret);
+		dev_err(dev, "Failed to get bootinfo, ret=%02x\n", ret);
 		goto err;
 	}
 
@@ -373,8 +373,7 @@ int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info)
 
 	ret = s3fwrn5_fw_get_base_addr(&bootinfo, &fw_info->base_addr);
 	if (ret < 0) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Unknown hardware version\n");
+		dev_err(dev, "Unknown hardware version\n");
 		goto err;
 	}
 
@@ -409,6 +408,7 @@ bool s3fwrn5_fw_check_version(const struct s3fwrn5_fw_info *fw_info, u32 version
 
 int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info)
 {
+	struct device *dev = &fw_info->ndev->nfc_dev->dev;
 	struct s3fwrn5_fw_image *fw = &fw_info->fw;
 	u8 hash_data[SHA1_DIGEST_SIZE];
 	struct crypto_shash *tfm;
@@ -421,8 +421,7 @@ int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info)
 
 	tfm = crypto_alloc_shash("sha1", 0, 0);
 	if (IS_ERR(tfm)) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Cannot allocate shash (code=%pe)\n", tfm);
+		dev_err(dev, "Cannot allocate shash (code=%pe)\n", tfm);
 		return PTR_ERR(tfm);
 	}
 
@@ -430,21 +429,18 @@ int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info)
 
 	crypto_free_shash(tfm);
 	if (ret) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Cannot compute hash (code=%d)\n", ret);
+		dev_err(dev, "Cannot compute hash (code=%d)\n", ret);
 		return ret;
 	}
 
 	/* Firmware update process */
 
-	dev_info(&fw_info->ndev->nfc_dev->dev,
-		"Firmware update: %s\n", fw_info->fw_name);
+	dev_info(dev, "Firmware update: %s\n", fw_info->fw_name);
 
 	ret = s3fwrn5_fw_enter_update_mode(fw_info, hash_data,
 		SHA1_DIGEST_SIZE, fw_info->sig, fw_info->sig_size);
 	if (ret < 0) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Unable to enter update mode\n");
+		dev_err(dev, "Unable to enter update mode\n");
 		return ret;
 	}
 
@@ -452,21 +448,18 @@ int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info)
 		ret = s3fwrn5_fw_update_sector(fw_info,
 			fw_info->base_addr + off, fw->image + off);
 		if (ret < 0) {
-			dev_err(&fw_info->ndev->nfc_dev->dev,
-				"Firmware update error (code=%d)\n", ret);
+			dev_err(dev, "Firmware update error (code=%d)\n", ret);
 			return ret;
 		}
 	}
 
 	ret = s3fwrn5_fw_complete_update_mode(fw_info);
 	if (ret < 0) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Unable to complete update mode\n");
+		dev_err(dev, "Unable to complete update mode\n");
 		return ret;
 	}
 
-	dev_info(&fw_info->ndev->nfc_dev->dev,
-		"Firmware update: success\n");
+	dev_info(dev, "Firmware update: success\n");
 
 	return ret;
 }
diff --git a/drivers/nfc/s3fwrn5/nci.c b/drivers/nfc/s3fwrn5/nci.c
index e374e670b36b..ca6828f55ba0 100644
--- a/drivers/nfc/s3fwrn5/nci.c
+++ b/drivers/nfc/s3fwrn5/nci.c
@@ -47,6 +47,7 @@ const struct nci_driver_ops s3fwrn5_nci_prop_ops[4] = {
 
 int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, const char *fw_name)
 {
+	struct device *dev = &info->ndev->nfc_dev->dev;
 	const struct firmware *fw;
 	struct nci_prop_fw_cfg_cmd fw_cfg;
 	struct nci_prop_set_rfreg_cmd set_rfreg;
@@ -55,7 +56,7 @@ int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, const char *fw_name)
 	int i, len;
 	int ret;
 
-	ret = request_firmware(&fw, fw_name, &info->ndev->nfc_dev->dev);
+	ret = request_firmware(&fw, fw_name, dev);
 	if (ret < 0)
 		return ret;
 
@@ -77,13 +78,11 @@ int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, const char *fw_name)
 
 	/* Start rfreg configuration */
 
-	dev_info(&info->ndev->nfc_dev->dev,
-		"rfreg configuration update: %s\n", fw_name);
+	dev_info(dev, "rfreg configuration update: %s\n", fw_name);
 
 	ret = nci_prop_cmd(info->ndev, NCI_PROP_START_RFREG, 0, NULL);
 	if (ret < 0) {
-		dev_err(&info->ndev->nfc_dev->dev,
-			"Unable to start rfreg update\n");
+		dev_err(dev, "Unable to start rfreg update\n");
 		goto out;
 	}
 
@@ -97,8 +96,7 @@ int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, const char *fw_name)
 		ret = nci_prop_cmd(info->ndev, NCI_PROP_SET_RFREG,
 			len+1, (__u8 *)&set_rfreg);
 		if (ret < 0) {
-			dev_err(&info->ndev->nfc_dev->dev,
-				"rfreg update error (code=%d)\n", ret);
+			dev_err(dev, "rfreg update error (code=%d)\n", ret);
 			goto out;
 		}
 		set_rfreg.index++;
@@ -110,13 +108,11 @@ int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, const char *fw_name)
 	ret = nci_prop_cmd(info->ndev, NCI_PROP_STOP_RFREG,
 		sizeof(stop_rfreg), (__u8 *)&stop_rfreg);
 	if (ret < 0) {
-		dev_err(&info->ndev->nfc_dev->dev,
-			"Unable to stop rfreg update\n");
+		dev_err(dev, "Unable to stop rfreg update\n");
 		goto out;
 	}
 
-	dev_info(&info->ndev->nfc_dev->dev,
-		"rfreg configuration update: success\n");
+	dev_info(dev, "rfreg configuration update: success\n");
 out:
 	release_firmware(fw);
 	return ret;
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
