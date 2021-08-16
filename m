Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 332913ECD6C
	for <lists+linux-nfc@lfdr.de>; Mon, 16 Aug 2021 06:06:18 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 30AED100EBB6E;
	Sun, 15 Aug 2021 21:06:16 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B02D0100EBB6A
	for <linux-nfc@lists.01.org>; Sun, 15 Aug 2021 21:06:13 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id n5so3958142pjt.4
        for <linux-nfc@lists.01.org>; Sun, 15 Aug 2021 21:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CntWjWrVI+9wJAIhsJHxIdINWHX6K7GTLyHrHWRCF08=;
        b=e1znWAlUSSTgSiqnm1x3W0BvHryyHeUABmR4Yua0EnOEqllg1EyMg1FfXA5e11oqOI
         f5xuqOPj1wpYVGQ48CcAW7f3q2ZqodUF9CUu6dxgVzbpYL27qrf7INw1bWAFmQKAJ1Mi
         JFqpKOtL3jHteCZWHH8KVkctbhDkWIK0Fnj1Zjcb6TOctzU8OMXNvIGJOXXdGHxqueHA
         gT0iOjOI8vFtKtvLX83eOSdVJ6oX7FQtygmB75Kcfb0K6HrMz6qxHjLeZDC1BcD+n5Th
         Ojt7FXAJSN4SyzWv3JMSG1SWUJimN5CCFw0rPJqtCmlGNOJxNCk4hsRfNyNsPENoTF68
         hseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CntWjWrVI+9wJAIhsJHxIdINWHX6K7GTLyHrHWRCF08=;
        b=qaxzIYZRX+gxbg/QWPFJVIrtODeAAkea/KDJT3tr8JZpHf1aRlpcavvz5Vvz1PgxeY
         NnlbwF1n/yTVKCDCMFT6DXu1zg4iQhHBKZfxd441PwgQaJTE8aAOnSqVi1x36aTgGzDc
         iSYDyIH4WKUSDQXw0pw0PBaO5739t574Gq7L1TB460MBx46SINapo5/P4JczcRsr0cP1
         N3VC/QKaqIg79OGtyveOv4ER0rpTFtgmQt+ckq5jIC7ZqldT9yuZRI2OYLMOkBdJl12e
         g3PZVhvusM8wnV8tsLqUEiQv/BNBq4rnYtQrfKk//c50Gn6agUYIyoDxc3xNNfU0xoRB
         u/2w==
X-Gm-Message-State: AOAM533TmJhrtvfAae+Wv0RsKjpCyc8OkVvM7wsGO5j758zYHAI4XWLu
	1ZB9g6a6++ZuWyrX52otxOc=
X-Google-Smtp-Source: ABdhPJzfmnPrEr1G6tjCFgUBixkUlgzS1mc8hBLf656um/VClXoPZe0tY2Sh931MohkQIC4G/8TKLw==
X-Received: by 2002:a17:90a:7aca:: with SMTP id b10mr14848504pjl.172.1629086772531;
        Sun, 15 Aug 2021 21:06:12 -0700 (PDT)
Received: from ubuntu.localdomain ([182.226.226.37])
        by smtp.gmail.com with ESMTPSA id i6sm9436998pfa.44.2021.08.15.21.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 21:06:12 -0700 (PDT)
From: bongsu.jeon2@gmail.com
To: shuah@kernel.org,
	krzysztof.kozlowski@canonical.com
Date: Sun, 15 Aug 2021 21:05:57 -0700
Message-Id: <20210816040600.175813-1-bongsu.jeon2@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: JBYFPLALPRTAJ2EJOTJ2Q5DU3XL2HMPV
X-Message-ID-Hash: JBYFPLALPRTAJ2EJOTJ2Q5DU3XL2HMPV
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next 0/3] Update the virtual NCI driver and the NCI selftests
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/JBYFPLALPRTAJ2EJOTJ2Q5DU3XL2HMPV/>
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
1/3 is the patch to use wait queue in virtual device driver.
2/3 is the patch to remove the polling code in selftests.
3/3 is the patch to add the NCI testcase in selftests.

Bongsu Jeon (3):
  nfc: Change the virtual NCI device driver to use Wait Queue
  selftests: Remove the polling code to read a NCI frame
  selftests: Add the NCI testcase reading T4T Tag

 drivers/nfc/virtual_ncidev.c          |  10 +-
 tools/testing/selftests/nci/nci_dev.c | 417 ++++++++++++++++++++++----
 2 files changed, 362 insertions(+), 65 deletions(-)

-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
