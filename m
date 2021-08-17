Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1F3EED5A
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Aug 2021 15:28:41 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3DECC100EBB68;
	Tue, 17 Aug 2021 06:28:38 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BD7FE100EBBCB
	for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:35 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id om1-20020a17090b3a8100b0017941c44ce4so5147758pjb.3
        for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OzNUm8hN1AEsHQGtDta7OSeQVgR7GVTLDRlUoY7wuUY=;
        b=nz1+0HpqWM7CXmGnMuDOtCz/0d9QhZJdet+zPgDQsTWVAYZQmRB1bdJW+L8Km8dgbX
         M4jSA0ura8Gg6qK8XmNVt0bKOeH5cWWz/eU3lZy92okhsOUH5HnsvJUgj+vEDB7sgold
         aplY+rmi00PBCVcdo2qClNXDIAB/yy6n4xzxgmlkeYASNiT8g2RkqtY4thbEGz1KYo18
         4ZqbxAWB0z+/ydZgzB640i4d6R+RCP2lzod6KxZm14/38wdR1qrNtHBTe3Jnspkt721Y
         PUlifTcJ2BGJI+mhw3Vn+Xu4C79GcujCgan57vqiExOxVrPa2w3kUs/XBG4r8KZ9rpM7
         3GKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OzNUm8hN1AEsHQGtDta7OSeQVgR7GVTLDRlUoY7wuUY=;
        b=hgOk9DnUP4lOIAWrVAJna3Go6RWd7tMaPRLZH6dH8SUR5B1S+BC7h+llJrmySt0894
         kOcPBB4/Aq//CJ1CZtuu/tbCCny3H/jMpiqwVlY1qxIP7qihS8P8NmTrwfvrcRNbTp94
         2A+ufCFV/oXWa3IEIw3VDMWmKFukahHtZNsEx+FBcrxeT/F+FCDmDMiDNxoZSituHE0W
         CeVF6dLhyAmmyfQuqXL5x3+EQ8Hd0nu6wFmOMYWPXxBTrcetkBHpJjZAs1uuTBL5U3qD
         R41wGiADQE7V5RkzopwtgkFiP//YVgXvnSi/m9U/wlsa4kZu2r/yq0ac0SgYO8EtrhF9
         wlZQ==
X-Gm-Message-State: AOAM531cl46OgvaDYs1nIgE5OTBVf7f7808CriOtIqlnIZADLO7/+23u
	9yoJyQ+Xuq5c9hHsKLfpVNw=
X-Google-Smtp-Source: ABdhPJyI8pt16zmUi71MCy0jpKoWpUkAdRvoLlsd+zvpPOCIQJK4+08tlGKUoAxiMpMSeBl/XEQHBg==
X-Received: by 2002:a17:902:da8a:b029:12c:6f0:fe3c with SMTP id j10-20020a170902da8ab029012c06f0fe3cmr2819657plx.41.1629206913694;
        Tue, 17 Aug 2021 06:28:33 -0700 (PDT)
Received: from ubuntu.localdomain ([182.226.226.37])
        by smtp.gmail.com with ESMTPSA id j6sm2791577pfi.220.2021.08.17.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 06:28:32 -0700 (PDT)
From: bongsu.jeon2@gmail.com
To: shuah@kernel.org,
	krzysztof.kozlowski@canonical.com
Date: Tue, 17 Aug 2021 06:28:10 -0700
Message-Id: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: 7RQH7CV45AJ4ASEAIN2GCG263HNS4NKW
X-Message-ID-Hash: 7RQH7CV45AJ4ASEAIN2GCG263HNS4NKW
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 0/8] Update the virtual NCI device driver and add the NCI testcase
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7RQH7CV45AJ4ASEAIN2GCG263HNS4NKW/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

This series updates the virtual NCI device driver and NCI selftest code
and add the NCI test case in selftests.

1/8 to use wait queue in virtual device driver.
2/8 to remove the polling code in selftests.
3/8 to fix a typo.
4/8 to fix the next nlattr offset calculation.
5/8 to fix the wrong condition in if statement.
6/8 to add a flag parameter to the Netlink send function.
7/8 to extract the start/stop discovery function.
8/8 to add the NCI testcase in selftests.

v2:
 1/8
 - change the commit message.
 - add the dfense code while reading a frame.
 3/8
 - change the commit message.
 - separate the commit into 3/8~8/8.

Bongsu Jeon (8):
  nfc: virtual_ncidev: Use wait queue instead of polling
  selftests: nci: Remove the polling code to read a NCI frame
  selftests: nci: Fix the typo
  selftests: nci: Fix the code for next nlattr offset
  selftests: nci: Fix the wrong condition
  selftests: nci: Add the flags parameter for the send_cmd_mt_nla
  selftests: nci: Extract the start/stop discovery function
  selftests: nci: Add the NCI testcase reading T4T Tag

 drivers/nfc/virtual_ncidev.c          |   9 +-
 tools/testing/selftests/nci/nci_dev.c | 416 ++++++++++++++++++++++----
 2 files changed, 362 insertions(+), 63 deletions(-)

-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
