Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FD62D97F7
	for <lists+linux-nfc@lfdr.de>; Mon, 14 Dec 2020 13:28:39 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6C8E8100ED498;
	Mon, 14 Dec 2020 04:28:38 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::1041; helo=mail-pj1-x1041.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 11E64100ED490
	for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 04:28:34 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id v1so6151609pjr.2
        for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 04:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=07u9K7qAejnZ1AxQEPtLr06bSZi6WWdia77VeMAOMaQ=;
        b=JcEyTWu2UOHibV9usPkBnZgqxc6g0lA6QrFTY24VeoqEAidkt/WdGG+XbslL0jPO/H
         l5g0bt/7Me4Jt/SMbugHdEjgVMOju/eDaTGDs5ESL7Wy5c5PVPsIgoGgpv0zyOTgMvYD
         pN/ZttlxrNTaQNStVjOvNDyf5m0+vjv/wTgMBtItvnh5jwYI773m0YxikZfaFuRun98K
         yl/T74D/N1kemj6hLvl2usJAMZKu0CEZevKGQDEYaVwexhH6AHbhXlRi1YeoqwLoaPAv
         G5aFhrGzXZy/6LM39akORWCqnpJ86b18LMsTTdTf2TXJXjXv8eHePKBKpruh2hwLu8Ro
         xYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=07u9K7qAejnZ1AxQEPtLr06bSZi6WWdia77VeMAOMaQ=;
        b=tEfIdgc6pxhauY+BIgAJlozs3UrtJsi6GGzxZHxFwOVMNbZKQ6fLhiiwYBCaO/mC90
         xJsRaIWGaXGuP+iNKfXZhKKVR92dhgbUp7QqQIbjO75S2DhX8ywoYNcy/HWjtI+GIiLp
         pkOi0TSh1LJFLrjkwAUj9JDq3ZzXMn5iWwCJ11OrVrVtbXSPdo74qKbg1kOulOoQC1ST
         hMW9VhmJiAnXmIOm/tO9nTqqSVShTilQjHHzIEgyoiT4ACjxJpZf9oGOUPtnbHh+ReCr
         duLcTcyBM5rp8jRsQeaMiLNocx07k1E2D5zgnU40X4xDTDwDpCS68Xv/MNElVQrGLDJ/
         H8Ug==
X-Gm-Message-State: AOAM533u9bDG8CyICufdCI5Hgaz65QU+HoBWleOa0Pm01PE8TRvo0eIZ
	bRdutxpmBRFGYwNYm1oH8e4=
X-Google-Smtp-Source: ABdhPJxvFyea72ZXOadXN6hiQN2xi1NxMm3ERgg4Kc38UImajV8HVri2OqtZkR8lGNCqQsmQ7AphMQ==
X-Received: by 2002:a17:90a:a58f:: with SMTP id b15mr17964901pjq.17.1607948914220;
        Mon, 14 Dec 2020 04:28:34 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id i2sm18938458pjd.21.2020.12.14.04.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 04:28:33 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Mon, 14 Dec 2020 21:28:23 +0900
Message-Id: <20201214122823.2061-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: I64MEEVE6F6XAB5ZAWNAXI7M53JL3UPS
X-Message-ID-Hash: I64MEEVE6F6XAB5ZAWNAXI7M53JL3UPS
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next] MAINTAINERS: Update maintainer for SAMSUNG S3FWRN5 NFC
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/I64MEEVE6F6XAB5ZAWNAXI7M53JL3UPS/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

add an email to look after the SAMSUNG NFC driver.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c1a6ba5ef26..cb1634eb010d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15425,6 +15425,7 @@ F:	include/media/drv-intf/s3c_camif.h
 SAMSUNG S3FWRN5 NFC DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Krzysztof Opasiak <k.opasiak@samsung.com>
+M:	Bongsu Jeon <bongsu.jeon@samsung.com>
 L:	linux-nfc@lists.01.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
