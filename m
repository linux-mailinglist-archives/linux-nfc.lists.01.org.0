Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74DD4935C8
	for <lists+linux-nfc@lfdr.de>; Wed, 19 Jan 2022 08:48:27 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 71535100EA12F;
	Tue, 18 Jan 2022 23:48:25 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B1400100EA12E
	for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:48:23 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A26E53F1C9
	for <linux-nfc@lists.01.org>; Wed, 19 Jan 2022 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642578501;
	bh=2jKKtwT8U2ZjS2owoIl90/o2oS9mRK8L4uaYNKpk42E=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=TF8CmseUqaUs2hMGop45/2iakC5MLrWhfALthmTdT85WPXPEE2tmq8EEWqVi584zN
	 0O3ivI7lFNlJD7R8UAJN8OV2LhgoYv0KcNU+vHgsJ8IM1aK072TztcZDdk8jGPO+6J
	 owyom0Ap1NjBFnoGV2Wjtu7MIUm7lGx4DVFkhrXn4JdALm2kjwviSd/5SahH/rBb8D
	 nKc+wtW21L/rSngmhihfqUu/6xr7sbjV+NU50Zx/kgfw60/RToU8+Ec/pg8Z32IfWf
	 cJzHMUvfjHrem+rMgPnYnC0PSd248L5Ndy8dewzk3fRCs883QgBgnTiM4fzg3OZSe5
	 Rs1UH0Aq3J2jQ==
Received: by mail-ed1-f69.google.com with SMTP id h11-20020a05640250cb00b003fa024f87c2so1497504edb.4
        for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2jKKtwT8U2ZjS2owoIl90/o2oS9mRK8L4uaYNKpk42E=;
        b=0AuIKTs4uDxERYdgV9WPcXD7eGYwhpOzBljq3qgiWG2mrRAJMce1Jgfn283gVHIIjn
         EzvhKiDsG/VLM5ZHD+7JC2Yq6s69nLF1vMs0qNNtd+E6PtJvN3WhINDVotCEJMM2Oodn
         sWx7soR+5j1xL2thtTdWO5XnG0jcw3O82AwPt9Co8gcrzhgcKMw4Ms4Tnfde60ImT3D8
         GuepCThWOgg4lNLbTGA0g9d+uGLHpfvJ/vA+LxSn8s/JcAdkDOQTyiZ835QbkaeYs2CR
         AsarMN0Sdrh51xJFpjI2iTcu02rRtySTOImOXO6y7aaJ/9Ojal+DPpMNL69gXRDhHuMB
         L4pA==
X-Gm-Message-State: AOAM531NdKJL0pIhAS8EA2xm/LvquoCNBjF0rzEjIBtnjUxFnwdfVnZn
	tAm0wny5HDiv4R8creeLJMiNxTvLcwCBXX8vQUqMNvW/kx6k9inY4bJXF596dS67N7vYfh1SVeS
	QAX7WIHkSz6CPCCg5KHIlTG579j0xYkUHGA==
X-Received: by 2002:a17:906:6a26:: with SMTP id qw38mr25162756ejc.518.1642578501333;
        Tue, 18 Jan 2022 23:48:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBJJ+D+Tgq9B5aFBleb+XhTnMg8VYuhYEnYb09JDxdkPCu5o0uND7RGdYnhQeIZ0M9harBmQ==
X-Received: by 2002:a17:906:6a26:: with SMTP id qw38mr25162751ejc.518.1642578501194;
        Tue, 18 Jan 2022 23:48:21 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id zo4sm1104996ejb.143.2022.01.18.23.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 23:48:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 19 Jan 2022 08:48:15 +0100
Message-Id: <20220119074816.6505-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: VCZKQMTGXHMWS6L7LFWPLVNY37Y52ZRP
X-Message-ID-Hash: VCZKQMTGXHMWS6L7LFWPLVNY37Y52ZRP
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 0/1] nfc: llcp: a fix after syzbot report
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VCZKQMTGXHMWS6L7LFWPLVNY37Y52ZRP/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Syzbot reported an easily reproducible NULL pointer dereference which I was
struggling to analyze:
https://syzkaller.appspot.com/bug?extid=7f23bcddf626e0593a39

Although direct fix is obvious, I could not actually find the exact race
condition scenario leading to it.  The patch fixes the issue - at least under
my QEMU - however all this code looks racy, so I have a feeling I am plumbing
one leak without fixing root cause.

Therefore I would appreciate some more thoughts on first commit.

Testing
=======
Under QEMU only. The NFC/LLCP code was not really tested on a device.

Best regards,
Krzysztof

Krzysztof Kozlowski (1):
  nfc: llcp: fix NULL error pointer dereference on sendmsg() after
    failed bind()

 net/nfc/llcp_sock.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
