Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B055346A284
	for <lists+linux-nfc@lfdr.de>; Mon,  6 Dec 2021 18:10:59 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 82EEA100F3FC6;
	Mon,  6 Dec 2021 09:10:57 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 81FBD100F3FC4
	for <linux-nfc@lists.01.org>; Mon,  6 Dec 2021 09:10:55 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 7A3695C006B;
	Mon,  6 Dec 2021 12:10:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 06 Dec 2021 12:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=uDB7Ka3j+OgfKaNvd6gUmYZZDYu
	y4okIROllUdMoJng=; b=kYx6UASnxnaaHPfSggRl9fH+We2WZ6X2MRgJGCGH8ze
	kBGDQPZF5jT5xK6SyNvCBEv4L1jHgm/lz24JdrjTb7W3T7rMWSF4ICFFN+7Aa8Ts
	JxGmZEUOfqeJbpe4BRqLRV0AxSQNQbgqOoddWFeT6tGtsKJ5pmvub/g9SwglUsR0
	9TWA0fEjMmjDymLF7oNp6u01W2G/KIGhxYYxjJRj1Ix6uRYg0h1wGilJP9mlOXOM
	qpMs7kUTc1mlDpMFUsE2SHArFvptJm7kXd9NIZMs4N+60lLhfSrMzDO7utZS94xw
	SH5t+420kn+v5QEBkx3ojKQ/ZiT1VD8sHictW0kNaUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uDB7Ka
	3j+OgfKaNvd6gUmYZZDYuy4okIROllUdMoJng=; b=RHM57og0qU87VFM/3jI1oo
	kl+jnVlEjMqObxOXEt6n0h7xieLvVmCN/0IETLwEsTpml3tJxt+cDxt7D7hoX4WE
	6R4DKLkemlJLn6jS2FBmUhLh3T2VtMq4kjsz06SwOEfeOBP9qzZMQVIh2VuzUBLb
	/uF5HepC8l3YMaUI3oXjwm0U+KBMnFBcVdVz3OW3bSDvlspQod8eIFYAqdZW6M3v
	OSwuXV/GQwPXtLC3TQHVcviBjoQPRB4WePwvx45IGw3buLorwnkMAne1IWjM8PZk
	9eDaCHxCy88ybbwjP9R8phsaGP8FUM9XUwkQyR23V84eyd5o6Z9cBHPpJzpNqYaA
	==
X-ME-Sender: <xms:HUSuYc7aZFYEkz8Eiq2WED1yyis9dKptkf8w8WkF7lXOd3WF71wo0Q>
    <xme:HUSuYd5ZZAeoldivyhWhmhA-ipnizJqIWQ7Dnlo345AfpN9PdvmWA5Qxaop2Zxrq0
    o2DsHugxYuAi2Azyw>
X-ME-Received: <xmr:HUSuYbcPgKLma01-sTOcsc4lbXHdGd7dpL-TuMxOltbzuAc2kf2U3Hsn_yzNz-fNm_WTfnvX6Hr4F-d1Gz6KnVXkN8c_wt2AbiWY2nM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepieeugfdutdefiedtvdfftedufedvjeehgfevveefudfgjeffgeeiteet
    jedufffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:HUSuYRKHPLICuT1wBckASbHbaeyohYkn1vdoeKAzVMHfEmnEVJqPpg>
    <xmx:HUSuYQJz-6EdUThibWQ_1YOCWRe8ukH3j9hapeudQnNYnI-d1mMkWQ>
    <xmx:HUSuYSxgIiT0FhLzCby3OIhKsJPyHyqlAan97jD8i4aviBoc1O_Ajw>
    <xmx:HkSuYaiiomC_CjCTOlf8YXQpw-i9-BASa1pLjwUg1m_qsJL4L4cjfA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Dec 2021 12:10:53 -0500 (EST)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 5DA2F136006C; Mon,  6 Dec 2021 10:10:52 -0700 (MST)
Date: Mon, 6 Dec 2021 10:10:52 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20211206171052.GA234718@animalcreek.com>
References: <20211129050606.873494-1-mgreer@animalcreek.com>
 <20211129050606.873494-4-mgreer@animalcreek.com>
 <5664bce3-2c4e-3cc9-0f9c-40f80f207b8f@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5664bce3-2c4e-3cc9-0f9c-40f80f207b8f@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: JXFONB6ME7EMSSXTU26WQ5LPRSELE7UC
X-Message-ID-Hash: JXFONB6ME7EMSSXTU26WQ5LPRSELE7UC
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 3/6] test: Reformat Python test scripts
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/JXFONB6ME7EMSSXTU26WQ5LPRSELE7UC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Krzysztof.

On Wed, Dec 01, 2021 at 10:13:55AM +0100, Krzysztof Kozlowski wrote:
> On 29/11/2021 06:06, Mark Greer wrote:
> > Reformat the Python-based test scripts using the "Prettier"
> > beautifiers (default options). This brings the code closer to
> > conformance with the PEP 8 style guide.
> > 
> > Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> > ---
> >  test/bt-handover         | 249 ++++++++++++++++++--------------
> >  test/handover-agent      | 284 +++++++++++++++++++++---------------
> >  test/monitor-near        |  76 +++++-----
> >  test/ndef-agent          | 112 +++++++--------
> >  test/neard-ui.py         | 304 +++++++++++++++++++++------------------
> >  test/neardutils.py       | 138 ++++++++++--------
> >  test/phdc-simple-manager | 228 +++++++++++++++--------------
> >  test/test-adapter        | 156 ++++++++++----------
> >  test/test-device         | 218 ++++++++++++++++------------
> >  test/test-tag            | 204 +++++++++++++-------------
> >  10 files changed, 1076 insertions(+), 893 deletions(-)
> > 
> > diff --git a/test/bt-handover b/test/bt-handover
> > index eebae9338e00..468e58cb18a8 100755
> > --- a/test/bt-handover
> > +++ b/test/bt-handover
> > @@ -13,119 +13,152 @@ from dbus.lowlevel import MethodCallMessage, HANDLER_RESULT_NOT_YET_HANDLED
> >  
> >  mainloop = gobject.MainLoop()
> >  
> > -def device_added(path, interfaces):
> > -        for iface, props in interfaces.items():
> > -                if "org.neard.Device" in interfaces:
> > -                        print("Pairing with %s" % (path))
> > -                        device = dbus.Interface(bus.get_object("org.neard", path),
> > -                                                        "org.neard.Device")
> > -                        device.Push(({ "Type" : "Handover", "Carrier" : "bluetooth"}))
> > -                        break
> > -
> > -def device_removed(path, interfaces):
> > -        for iface in interfaces:
> > -                if "org.neard.Device" in interfaces:
> > -                        print("Lost device %s" % (path))
> > -                        mainloop.quit()
> > -                        break
> > -
> > -def remove_paired_devices(bt_adapter):
> > -        manager = dbus.Interface(bus.get_object("org.bluez", "/"),
> > -                                        "org.freedesktop.DBus.ObjectManager")
> > -        objects = manager.GetManagedObjects()
> >  
> > -        all_adapters = (path for path, interfaces in objects.items() if
> > -                                "org.bluez.Adapter1" in interfaces.keys()
> > -                                and path.endswith(bt_adapter))
> > -
> > -        bluez_adapter = None
> > -        for adapter in sorted(all_adapters):
> > -                bluez_adapter = dbus.Interface(bus.get_object("org.bluez",
> > -                                                        adapter),
> > -                                                        "org.bluez.Adapter1")
> > -                break
> > -
> 
> Which tool did you use?

I used "Prettier".  I'll try autopep8.

> The autopep8 produces different results, which
> look more readable in argument alignment:
> 
> --- a/test/bt-handover
> 
> +++ b/test/bt-handover
> 
> @@ -18,9 +18,8 @@ def device_added(path, interfaces):
> 
>      for iface, props in interfaces.items():
> 
>          if "org.neard.Device" in interfaces:
> 
>              print("Pairing with %s" % (path))
> 
> -            device = dbus.Interface(
> 
> -                bus.get_object("org.neard", path), "org.neard.Device"
> 
> -            )
> 
> +            device = dbus.Interface(bus.get_object("org.neard", path),
> 
> +                                    "org.neard.Device")
> 
>              device.Push(({"Type": "Handover", "Carrier": "bluetooth"}))
> 
>              break
> 
> 
> 
> Or in array elements:
> 
>      tag = neardutils.find_tag(sys.argv[2])
> 
> 
> 
>      if sys.argv[3] in ["Text"]:
> 
> -        tag.Write(
> 
> -            (
> 
> -                {
> 
> -                    "Type": "Text",
> 
> +        tag.Write(({"Type": "Text",
> 
>                      "Encoding": sys.argv[4],
> 
>                      "Language": sys.argv[5],
> 
> -                    "Representation": sys.argv[6],
> 
> -                }
> 
> -            )
> 
> -        )
> 
> +                    "Representation": sys.argv[6]}))
> 
> 
> 
>      elif sys.argv[3] == "URI":
> 
>          write_uri(sys.argv[4:])
> 
> 
> 
> The only trouble with autopep8 is that it puts every, even simple, if
> with parentheses:
> 
> -if sys.argv[1] == "write":
> 
> -    if len(sys.argv) < 5:
> 
> +if (sys.argv[1] == "write"):
> 
> +    if (len(sys.argv) < 5):
> 
>          usage()

Some time ago I thought I read that pep8 recommends using parentheses in
all if-statement expressions but now I can't find it.

> However existing code already had such syntax in few places.

I've never seen a beautifier that did it all the way that I liked but
consistency is good so I'll check use autopep8 and resubmit.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
