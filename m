Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA584287CD
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Oct 2021 09:39:57 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 90FAB100EAB12;
	Mon, 11 Oct 2021 00:39:53 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1C3D0100EAB0B
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 00:39:50 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2F8CE4001B
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 07:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633937987;
	bh=dKNe0YR2W1YWBul8nQdZBdCYA7T0luSH8qAs9JTPkS4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Nhh5O6gfPbBYiF2n2msQVeDEl1eSbaV76aYCqcft5IbmwkNeeB2mZMSUgEnMIxmnq
	 9EoQjROIVRDLgA/vkTc/zuDdq51aVNM6f7bOD4q5Ksp2TtKzf2oC6i9YjOFkJqnE0l
	 35bL8U2/MJPC4m6+8GqIltuYIxdS8nXi30J+/wUl45Pud1In6wDd9bbzYq4NJO9w7h
	 nOnAm7z0ln8ib+25DXWRSVe3lUtoYegOJABvbBBNAbhDImvMzXWezKvPAPP6rti4P0
	 NHV4dutEqCc4R8G/A0B9v1wSWtlu3FDn23v71pjLgfUXBKEjEsd29ZD/BKP5mjF8Dm
	 3yVoFSNsbhMgg==
Received: by mail-ed1-f69.google.com with SMTP id p13-20020a056402044d00b003db3256e4f2so15151003edw.3
        for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 00:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dKNe0YR2W1YWBul8nQdZBdCYA7T0luSH8qAs9JTPkS4=;
        b=t3W6BA5LrZWr6DtVbrHNqgsy7j/+KviF5xC/Dbel+tJdFmAPMxCQUEkwVUbSyffjqb
         YDX4urctT0/KLruYtkYdBMpso4iU1wY8t5IP1p6afPeV0qXsHMNmlX5J1QA/n82d1i6T
         rfp3Qa+RX92cv3vO6ZZHTw0ylTUsMgtvJERedKlyn8vqMmhQu+LO2VyJRiXApJshDpKo
         nxc+pNOSKrwI04wMnWRcwi5O4L4f+LVRkRMIup3/QbYNUqZxhg5I7RW+iAMTGmAOFFwV
         fcoM1kegGMyL0VBUVz+ZwlYL+P7wU3wRdR5Fb2/ghk5IaBUNRjaealV7iCDlu6tjtO6o
         67tA==
X-Gm-Message-State: AOAM530cwZU3FYPAvMqhBnBupnn+dcS0rBatFfENZHwZRCVsBRE12GAS
	fD7aD+yG/oCeeL1TyvBBobZOJxHWyKFhnabsKcOv5syvrkDEEafaHdsfFihSGyO3ls7OzZ2wKIP
	I8o8TT8mp10C9J1dimim5YH86eJH76M7JlQ==
X-Received: by 2002:a05:6402:848:: with SMTP id b8mr27593701edz.283.1633937984226;
        Mon, 11 Oct 2021 00:39:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4TGueCUqr8nipt9y1eUTDZZZuo1QIc9IRv4KZo7UB7TGDm48xnJ0Nl+i+OLa1EhAIjhllxw==
X-Received: by 2002:a05:6402:848:: with SMTP id b8mr27593641edz.283.1633937983622;
        Mon, 11 Oct 2021 00:39:43 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y8sm3023965ejm.104.2021.10.11.00.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 00:39:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Charles Gorand <charles.gorand@effinnov.com>,
	Mark Greer <mgreer@animalcreek.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Mon, 11 Oct 2021 09:39:26 +0200
Message-Id: <20211011073934.34340-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: YKJ7O2DW3RWHIRB5PPH6ZKYGNG2QGIMX
X-Message-ID-Hash: YKJ7O2DW3RWHIRB5PPH6ZKYGNG2QGIMX
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 0/8] nfc: dt-bindings: convert to dt-schema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YKJ7O2DW3RWHIRB5PPH6ZKYGNG2QGIMX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Changes since v1:
1. Drop clock-frequency from I2C devices.
2. Update commit msg.
3. Add patch 2/8: NXP PN547 binding.

Best regards,
Krzysztof

Krzysztof Kozlowski (8):
  dt-bindings: nfc: nxp,nci: convert to dtschema
  dt-bindings: nfc: nxp,nci: document NXP PN547 binding
  dt-bindings: nfc: nxp,pn532: convert to dtschema
  dt-bindings: nfc: st,st21nfca: convert to dtschema
  dt-bindings: nfc: st,st95hf: convert to dtschema
  dt-bindings: nfc: st,nci: convert to dtschema
  dt-bindings: nfc: ti,trf7970a: convert to dtschema
  dt-bindings: nfc: marvell,nci: convert to dtschema

 .../bindings/net/nfc/marvell,nci.yaml         | 170 ++++++++++++++++++
 .../devicetree/bindings/net/nfc/nfcmrvl.txt   |  84 ---------
 .../devicetree/bindings/net/nfc/nxp,nci.yaml  |  61 +++++++
 .../bindings/net/nfc/nxp,pn532.yaml           |  65 +++++++
 .../devicetree/bindings/net/nfc/nxp-nci.txt   |  33 ----
 .../devicetree/bindings/net/nfc/pn532.txt     |  46 -----
 .../bindings/net/nfc/st,st-nci.yaml           | 106 +++++++++++
 .../bindings/net/nfc/st,st21nfca.yaml         |  64 +++++++
 .../bindings/net/nfc/st,st95hf.yaml           |  57 ++++++
 .../bindings/net/nfc/st-nci-i2c.txt           |  38 ----
 .../bindings/net/nfc/st-nci-spi.txt           |  36 ----
 .../devicetree/bindings/net/nfc/st21nfca.txt  |  37 ----
 .../devicetree/bindings/net/nfc/st95hf.txt    |  45 -----
 .../bindings/net/nfc/ti,trf7970a.yaml         |  98 ++++++++++
 .../devicetree/bindings/net/nfc/trf7970a.txt  |  43 -----
 MAINTAINERS                                   |   3 +-
 16 files changed, 623 insertions(+), 363 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
 create mode 100644 Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
 create mode 100644 Documentation/devicetree/bindings/net/nfc/nxp,pn532.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/nxp-nci.txt
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/pn532.txt
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st,st21nfca.yaml
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st,st95hf.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/st21nfca.txt
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/st95hf.txt
 create mode 100644 Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/trf7970a.txt

-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
