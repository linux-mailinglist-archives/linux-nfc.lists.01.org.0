Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C47613E37F9
	for <lists+linux-nfc@lfdr.de>; Sun,  8 Aug 2021 04:22:40 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 790E4100EB34A;
	Sat,  7 Aug 2021 19:22:39 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 31E9F100EB345
	for <linux-nfc@lists.01.org>; Sat,  7 Aug 2021 19:22:37 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 9C6DC3200413;
	Sat,  7 Aug 2021 22:22:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 07 Aug 2021 22:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=z6JDTwkdI5dGzFkV81+tXA1Qcne
	vSoB64h0yzauO/oo=; b=Upi70VnH7K3yUa3onAjXDDthb5PSBgJQ0MybqvSOA7R
	2i8YabP9BISGVlGH4qj4wQSvEzODZeDf6/tvV77u16L4hxOGV9KSFhUFhn/j2bDb
	1QeDXtjWg4MYQ1bne3N8kVIzmN+YGtPWeyReBuOj5xwNUg/xQrnkplIVpoG9IO7m
	X2P5mx9P6HtKpOcAZkcHPxU/qw5hnzF0oMbGh0glyHO4im7wFBsoP6Uy+lOrOhWr
	mGyvsP5+WI2Dv/563Qef8vWMvDWYRscslO6vqBkKese5EES5uSOJhnmDSnb3frOn
	/v6N059d/JBDX/hDiDAJh/qYiIlkj9QEFUPwPvqkynA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=z6JDTw
	kdI5dGzFkV81+tXA1QcnevSoB64h0yzauO/oo=; b=lTDAFEkhfoS2t5MYJaIcrf
	pkyzoTzhb4LoZinv+100Xh5htJKzDWFft/tqM7FcJJANXkwsja8nHPwloYqLuND8
	1VA435Gk+qae/FOUOwbJKn9LdYnK20wZN1h8csCGL2mILB5AyCi9egqyO/uf4aSs
	43kRdl5PXD8zT8E7dmJeeNPCx/Oib/hJmfCSyM2hASFZBxCFw2lzWswBcyWLupog
	r/34o5yP8W+0luU39+FTRarKy+Jj5XZcn5Evc746bwZ/11GSzooTudAxCTRGvkXr
	gGxhbdfQC88zRoMrjk9NYHZJGlCbCErqd1y/dL8kk9z6wyMoDVhW1NOXD5GS6sMQ
	==
X-ME-Sender: <xms:7D8PYXb4QZr6krWc0Z21M9pX29YMnCGRgx3HdMJKf7FvHfFzR6M0GA>
    <xme:7D8PYWbqDpzRcyBUpl54svWefCTbJBxjqyPlyj9DuuX3pWvfdAhFVowp976H0AwEG
    ZnXdOmGIV0CWU-8RA>
X-ME-Received: <xmr:7D8PYZ_JWVqkrEpnz4JcBbX7C4ho3dBVkCz5v_g4mBFO1j22I1sOBVeHOVLxreyet9VDHoxrUKURWu-Mn4ox0naHuMIwPJr6y-hN8UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeeggdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjohesthdtre
    dttddtvdenucfhrhhomhepofgrrhhkucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgr
    lhgtrhgvvghkrdgtohhmqeenucggtffrrghtthgvrhhnpeeiuefguddtfeeitddvffetud
    efvdejhefgveevfedugfejffegieetteejudffhfenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhesrghnihhmrghltghrvggvkh
    drtghomh
X-ME-Proxy: <xmx:7D8PYdoe1yhBVfsdWRdfeVRF88DG96E2Qpz3YNeV4BFvygn5PVFVJA>
    <xmx:7D8PYSrDi2Ja5hpKQ_WvLgwKgYypvb8k388EHC6T2trxTehBqRuRfA>
    <xmx:7D8PYTRxeF4pGNqlnNJpYLry34rbN59oxm1S1Je7QV9n5-2Tr3KGRw>
    <xmx:7D8PYZTbFHe6ddHUQM1YGYZ0EccTaHe-LnVNL_2LbASacr7XREGlyw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Aug 2021 22:22:36 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 7637E136009E; Sat,  7 Aug 2021 19:22:35 -0700 (MST)
Date: Sat, 7 Aug 2021 19:22:35 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Cc: Mark Greer <mgreer@animalcreek.com>
Message-ID: <20210808022235.GA171412@animalcreek.com>
References: <20210808022058.171350-1-mgreer@animalcreek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210808022058.171350-1-mgreer@animalcreek.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: LIGENM74PJRTMTRIEUYIAI725VI6SR4L
X-Message-ID-Hash: LIGENM74PJRTMTRIEUYIAI725VI6SR4L
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] [neard][RFC] test: Convert Python2 scripts to Python3
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/LIGENM74PJRTMTRIEUYIAI725VI6SR4L/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Oops, please ignore the "[PATCH]" part of the subject.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
