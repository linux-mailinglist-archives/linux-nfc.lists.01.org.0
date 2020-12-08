Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B0B2D2CAA
	for <lists+linux-nfc@lfdr.de>; Tue,  8 Dec 2020 15:10:39 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 466E3100EC1C7;
	Tue,  8 Dec 2020 06:10:38 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4F22E100ED4BE
	for <linux-nfc@lists.01.org>; Tue,  8 Dec 2020 06:10:36 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id n7so12282131pgg.2
        for <linux-nfc@lists.01.org>; Tue, 08 Dec 2020 06:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=y+TsitjoIH7JH9XtdYcvo6WGHGk7yTErwwqWOT90yJs=;
        b=LH/JS4D0m7XlgPj3AwO9UpQ1nBJ/6Y0MA41PnlSZPWYKJ+j1uaoXlRkPA9CA9YHTUn
         wRe3Bff37TfY2yeNz8U7FtlmjKhLsJYIlbU6o/lTo4aqYAoIVT/pXOQDz5QwtgsJmg9M
         HxFVv4Elma9ml2rgvM5SSSo0wj8CQ5dZH86Hg7UUKqldAbxXrmDSlHYJltie83X3Bimc
         MpZ0c3dqqKtsYIm9AV6i68iGtrY1IxT3cwUhMNWFmfpyTVso3Ttto/WoBdEvwBDm6JiA
         RHIRuoFvQStBC0dlGbzk63MDjUbRc2Lyv6IdC7ljcW/9e732f+LgnXr7grkoFxy2faeo
         9QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=y+TsitjoIH7JH9XtdYcvo6WGHGk7yTErwwqWOT90yJs=;
        b=n3lUaYhmA0koMk63dRZJyUEGEY9zmcmFH5j8bJo+C0vwYzLRBjrPwnDrO/nNidbv/d
         icXEvU7TSeNwJErtJM198ErqZBodOJ3LI3cIiJTjBj4H8Jco08owEcgxD8TCH7J/bxEz
         AfZrV6gcgcj7xZfm6sXyJYby/6e6qSOSGpC4tXHG5FBaBuHZqUG2dt9B2bNo16ORVb9w
         ethL9FpbW9pNWNzQwqfP44STQRxu6IT4H+l6n0rDDwAmISfd0RRPBoJd4BybJXC+mRKE
         pvnrGTlFw+OVyMFNEFnTMRzkBaJZV3Yzjrf6oyGcqYPZRvea20ncTIJbs1RXIFEpDHRF
         MLAA==
X-Gm-Message-State: AOAM532WMaZoZLXQAFipR9EGJIevmQqZMAApZxs9lAdAEL6i5f5T6YEH
	02ztWVF0MEIRxlwcCS+whlg=
X-Google-Smtp-Source: ABdhPJzxMAj44XvY1JnbcrdV2ne9K3OSDAYvDMV0QTQMPNVlGHzRrlDWcsvhB82njiBXQIZKz6NAAg==
X-Received: by 2002:a65:594b:: with SMTP id g11mr22767467pgu.424.1607436635756;
        Tue, 08 Dec 2020 06:10:35 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id m15sm9071951pfa.72.2020.12.08.06.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 06:10:34 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Tue,  8 Dec 2020 23:10:10 +0900
Message-Id: <20201208141012.6033-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: VVDXO4DETLDZGQP2P7OLOGUFPPLKHTJJ
X-Message-ID-Hash: VVDXO4DETLDZGQP2P7OLOGUFPPLKHTJJ
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 0/2] nfc: s3fwrn5: Change I2C interrupt trigger to EDGE_RISING
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VVDXO4DETLDZGQP2P7OLOGUFPPLKHTJJ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

For stable Samsung's I2C interrupt handling, I changed the interrupt 
trigger from IRQ_TYPE_LEVEL_HIGH to IRQ_TYPE_EDGE_RISING and removed 
the hard coded interrupt trigger type in the i2c module for the flexible 
control.

1/2 is the changed dt binding for the edge rising trigger.
2/2 is to remove the hard coded interrupt trigger type in the i2c module.

ChangeLog:
 v2:
  2/2
   - remove the hard coded interrupt trigger type.

Bongsu Jeon (2):
  dt-bindings: net: nfc: s3fwrn5: Change I2C interrupt trigger to
    EDGE_RISING
  nfc: s3fwrn5: Remove hard coded interrupt trigger type from the i2c
    module

 .../devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml      | 2 +-
 drivers/nfc/s3fwrn5/i2c.c                                 | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
