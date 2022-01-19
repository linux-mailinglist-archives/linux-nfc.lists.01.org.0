Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4F14935E2
	for <lists+linux-nfc@lfdr.de>; Wed, 19 Jan 2022 08:53:41 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2F966100F3956;
	Tue, 18 Jan 2022 23:53:27 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6F06E100F3956
	for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:10 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E1EFE3F19C
	for <linux-nfc@lists.01.org>; Wed, 19 Jan 2022 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642578784;
	bh=yRTE0dXDieeLqipRcJqUM5emUc5L/qHhnbBmseJ0BJU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=iIpR0G7c7kwiP0iowgFW2FKd7H5egEOlOMNYem9PsGTlMNC/53RvS6Wpk5WgeaGs7
	 5mOFuva6OQugbGEF60cFPAxLvZqI59c2cDz2KeRfTy/zYp5m7WQyW9jN088ZbMUVjc
	 73oRpc9k+zZE7Y0t9YFkduBhMgpE11sMR0jFhBqjHNna3YBm9/+TLY8ReIgYqt0u/W
	 QPXh3jd7tDYB781UQ/V+s6eiIjCR1j8FDfydSvR8T7iB8BPRnrr0MkXorfGU44kZP9
	 ENfhkFSlZ0sh4U6XShhV+ChXKXqPBytIy0NnQWAgF4ADxC+wEkh+QPJk3ej3/pRHYZ
	 zqaI6ZnTm+q6g==
Received: by mail-ed1-f71.google.com with SMTP id cf15-20020a0564020b8f00b0040284b671c6so1447512edb.22
        for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yRTE0dXDieeLqipRcJqUM5emUc5L/qHhnbBmseJ0BJU=;
        b=p/LNSi/Lm9KxOdiTHGUv+IPLr4g7Zg9DqC70JsWWo8GyyA8lGHYhN/UbdUYj0MacxC
         gjuMB5dnJy3vAkX0x5wWqrOJ19LMeQOtgviiG/dKRcy8aVNu4+p3QLVTCCXSvL5OODSB
         +DN95E4+E83g3G2CRGmyJR9eWAjZt0dGnASCY3QNyD5YVF4R7OrRG063bHCuveWbySmT
         u7KktnvGS069TI0NBBbfsReu5qatM0U9Wnsf8oW7V0jADgOTj11JXwPEkBeX2v3SSJgs
         4iJTgZ5vQsPtxc5pNCjRR8OBm2awBruv+VMdqFgYAlJh2vmcdu0oHueoKiJE6JeDVauC
         d1PA==
X-Gm-Message-State: AOAM530XQgIfFcvwyLjkrISVHd3tGi+2iiZWe/bE+07LQjUww/mKhr2O
	Ne2i1Qam0m4dLs3/I9d+ppkgrZP+gBLV8L0o6XUFDqNiO7LBps63Dih/ADtNs7giJvp8BGvjzQV
	UJQTYYqnYPpB3af5ePLGSP62FOwdgG1UszA==
X-Received: by 2002:a05:6402:2550:: with SMTP id l16mr28981889edb.83.1642578784391;
        Tue, 18 Jan 2022 23:53:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeJ973sell7ijTjlg0/rOOH2O7fjiphhNI7GxRSALdcgF4gRx3wFZOAIWZGt7K+MuWZVX4nA==
X-Received: by 2002:a05:6402:2550:: with SMTP id l16mr28981884edb.83.1642578784265;
        Tue, 18 Jan 2022 23:53:04 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id w17sm805286edr.68.2022.01.18.23.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 23:53:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 19 Jan 2022 08:52:55 +0100
Message-Id: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: POPB6LYBPJDKXEL3UA5TOFSJW4EEZYHK
X-Message-ID-Hash: POPB6LYBPJDKXEL3UA5TOFSJW4EEZYHK
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 0/6] nfc: llcp: few cleanups/improvements
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/POPB6LYBPJDKXEL3UA5TOFSJW4EEZYHK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

These are improvements, not fixing any experienced issue, just looking correct
to me from the code point of view.

Changes since v1
================
1. Split from the fix.

Testing
=======
Under QEMU only. The NFC/LLCP code was not really tested on a device.

Best regards,
Krzysztof

Krzysztof Kozlowski (6):
  nfc: llcp: nullify llcp_sock->dev on connect() error paths
  nfc: llcp: simplify llcp_sock_connect() error paths
  nfc: llcp: use centralized exiting of bind on errors
  nfc: llcp: use test_bit()
  nfc: llcp: protect nfc_llcp_sock_unlink() calls
  nfc: llcp: Revert "NFC: Keep socket alive until the DISC PDU is
    actually sent"

 net/nfc/llcp.h      |  1 -
 net/nfc/llcp_core.c |  9 +--------
 net/nfc/llcp_sock.c | 49 ++++++++++++++++++++++-----------------------
 3 files changed, 25 insertions(+), 34 deletions(-)

-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
