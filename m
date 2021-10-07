Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD0B4259B5
	for <lists+linux-nfc@lfdr.de>; Thu,  7 Oct 2021 19:45:08 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0DBEF100EA2A8;
	Thu,  7 Oct 2021 10:45:07 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 584D4100EA2A4
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 10:45:05 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 66AB03FFEF
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 17:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633628703;
	bh=Coe08tkAG3DLADP+J9knykBNBTwMfZOYcNMbzRGgajM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=kYC7oH6Pq/+x2J9TxxpklkV86xXqxZqDguDhQJXe+Euo/E+STOQWV/5EJtDt2Z9M0
	 y/A044R9zBivmyN3kthkJ5dcsk3VWrR60hfs3P3DSovkvUZy+sqwdXJmNhGZcOEOug
	 DJM5eyqiot5RGBHXkNPsdpWfPfkgPHeSJpXGKLjtUSdV/082aHg78/7IdYp6Bgs0Qq
	 7izRAjDOj026LDXApZ5MJfWDrb/83fSEtspJnFUL52QWXoRFWVpX9GUd3BZy9tZ0m0
	 6kndb94O5O7OwyUInoPnzS0MnTKbQLspwbNQWjgl1E20LjrlKcH7aUitF+j8hK8qFs
	 G6TXbwiC/WaeA==
Received: by mail-ed1-f70.google.com with SMTP id p13-20020a056402044d00b003db3256e4f2so6684845edw.3
        for <linux-nfc@lists.01.org>; Thu, 07 Oct 2021 10:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Coe08tkAG3DLADP+J9knykBNBTwMfZOYcNMbzRGgajM=;
        b=yYgIYTof5+jHjvFpFukCSlOqqTaUxUihyvoy0HWihkvDcRKSLXlGcA5H2tgGLRA7XM
         hIYidhtX8SNLApqOKIsCt16Mcze+2GB0cmSy02ExBX9y/+tTzN5ZlrNBrUbjHJxhDj2E
         aiyGMdz7IiMMde7MR5lLEgaF7w3Gr9TkW+OcS9K/BWkCfUJjONhHgAxU1L6VLQXin3XU
         1r4dzPraOuQvf43KDbsXN1nOGvD4YriLJx3JKj+mbrgTxhr83rH09FDhY6m/NYzPXO7g
         LlwyMkN5q4sJSV0e9p2RzaFpnZWpwIBxv2Hg1XisWYXCDiOFCtFRbvLL9WyHNAM1IesA
         uktA==
X-Gm-Message-State: AOAM5316i3C6YzguS1bZJLn+m1tyCK/RzwKhfGIjH1eIR3r3yxznc3NW
	iG765cH6lkWw4CoWywF7fsNUX3SDQTj10UcvHvQc5oZl4QOVeXLXFMyjicMpEfe4o07b5VCoWxQ
	zrq+hOWWYBGD+IA+EuN7N2y1HMW2wsSkZQQ==
X-Received: by 2002:a05:6402:40f:: with SMTP id q15mr7790473edv.333.1633628703102;
        Thu, 07 Oct 2021 10:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/cRrFbBE0AEAY1wTn0RkOd29OzBi3ThqVg6eaCa0cLj3RymI+vrrOi/pDfxhLH7N7JZpaZg==
X-Received: by 2002:a05:6402:40f:: with SMTP id q15mr7790386edv.333.1633628702498;
        Thu, 07 Oct 2021 10:45:02 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id u23sm24243ejx.99.2021.10.07.10.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 10:45:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Lin Ma <linma@zju.edu.cn>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Thu,  7 Oct 2021 19:44:30 +0200
Message-Id: <20211007174430.62558-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: SCOPQND7LLIMHFDS6SYLO664GVRVJ2SC
X-Message-ID-Hash: SCOPQND7LLIMHFDS6SYLO664GVRVJ2SC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Greg KH <greg@kroah.com>, Will Deacon <will@kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] nfc: nci: fix the UAF of rf_conn_info object
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SCOPQND7LLIMHFDS6SYLO664GVRVJ2SC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Lin Ma <linma@zju.edu.cn>

The nci_core_conn_close_rsp_packet() function will release the conn_info
with given conn_id. However, it needs to set the rf_conn_info to NULL to
prevent other routines like nci_rf_intf_activated_ntf_packet() to trigger
the UAF.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Lin Ma <linma@zju.edu.cn>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/nci/rsp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index a2e72c003805..b911ab78bed9 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -334,6 +334,8 @@ static void nci_core_conn_close_rsp_packet(struct nci_dev *ndev,
 							 ndev->cur_conn_id);
 		if (conn_info) {
 			list_del(&conn_info->list);
+			if (conn_info == ndev->rf_conn_info)
+				ndev->rf_conn_info = NULL;
 			devm_kfree(&ndev->nfc_dev->dev, conn_info);
 		}
 	}
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
