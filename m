Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 642652C36F6
	for <lists+linux-nfc@lfdr.de>; Wed, 25 Nov 2020 04:08:46 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DF74B100ED482;
	Tue, 24 Nov 2020 19:08:44 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D2287100ED480
	for <linux-nfc@lists.01.org>; Tue, 24 Nov 2020 19:08:41 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id j10so725582lja.5
        for <linux-nfc@lists.01.org>; Tue, 24 Nov 2020 19:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=t9WCWsnnCS0HjAluEuyOs6Y1ik0naTnbcxAT6lOfnCY=;
        b=RKdLKWUXVadiG3r0jVpgelQMtYmcS4CpN7wGwAsslONQm/+dnWL59MJE26B7Nqu/X6
         kLYhV8r/IsarKuOzVCN4yakN48MPYpjL55xW0F4JLbSknShhZTPoNqUMLvBh7K1Oc9pS
         8T2HohUt8JYB3LORZX6qIinOw4GhKbjD0Gqk7PYzsERF01eVT3y2Y9JnuXNZ5Rt167N2
         qwV7GPmdpF84bv/ugQOgBMi4tgAoxbDiRofKNoK2t1F7DXryMOXJt5YTJcMYrgsSUrne
         bmhNxZRoz6fzcj1Bz2ICAIVsk2n81WqnP0kTWBJPUywmeJJen6W1CuDB9sLvbr0poe0l
         9oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=t9WCWsnnCS0HjAluEuyOs6Y1ik0naTnbcxAT6lOfnCY=;
        b=SUqcL0ihK/031gi5yn8rFI70y3k0cNaTnta+Em7TPRVQB4nvnsJYrP9xk/iyf6/qI7
         p2VrouLWM+lj/fW+ucilO7GcdZu161p7SpmGMsBS/LXHNQgAF6jLAC7efnqz9EqEvxKi
         +N2b1rEJgI9lmruXA2YB3VyD58stAi+OKxhorE/W/qyBA5AWEHdluS20NMQzs4oXSNIn
         GAbHFLby+pudXpdMxuGOfQnnUSioHsCU72xA4vfP5YaVaoPTFgVIcOFtV03Od65VN0sX
         68jJ7Z1xtgFSCldrMHiCyisSc16rzTCvxHusDOgB1z/0ZZ1yt0H0ADsCEbA+x6s4CKeM
         Rh2Q==
X-Gm-Message-State: AOAM530BRMHNirHz1cGtBj5F8Wh2JtMljP5/umY9m/u6y0UtYxTknxUW
	OjvJjO/U99rtqsSDCknQJQiGA1R+Zn+u5j0zZP4=
X-Google-Smtp-Source: ABdhPJzDuHVIB4O6tYV9XeAPbHQQL17O9nVMT5QcLVzySXs8keyrLAsFVuhLOVhoGalmy5Iy1RUKIrrFmCKFu70R+AQ=
X-Received: by 2002:a2e:7c08:: with SMTP id x8mr493125ljc.8.1606273719116;
 Tue, 24 Nov 2020 19:08:39 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9a:999:0:b029:97:eac4:b89e with HTTP; Tue, 24 Nov 2020
 19:08:38 -0800 (PST)
In-Reply-To: <20201124114151.GA32873@kozik-lap>
References: <CGME20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
 <20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
 <20201123080123.GA5656@kozik-lap> <CACwDmQBh77pqivk=bBv3SJ14HLucY42jZyEaKAX+n=yS3TSqFw@mail.gmail.com>
 <20201124114151.GA32873@kozik-lap>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Wed, 25 Nov 2020 12:08:38 +0900
Message-ID: <CACwDmQDWtfa8tXkG8W+EQxjdYJ6rkVgN9PjOVQdK8CwUXAURMg@mail.gmail.com>
To: "krzk@kernel.org" <krzk@kernel.org>
Message-ID-Hash: 2KMO3QOFILWMVITX7WQGI6CC3UHO7BDK
X-Message-ID-Hash: 2KMO3QOFILWMVITX7WQGI6CC3UHO7BDK
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Bongsu Jeon <bongsu.jeon@samsung.com>, "kuba@kernel.org" <kuba@kernel.org>, "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 1/2] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2KMO3QOFILWMVITX7WQGI6CC3UHO7BDK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/24/20, krzk@kernel.org <krzk@kernel.org> wrote:
> On Tue, Nov 24, 2020 at 08:39:40PM +0900, Bongsu Jeon wrote:
>> On Mon, Nov 23, 2020 at 5:02 PM krzk@kernel.org <krzk@kernel.org> wrote:
>> >
>> > On Mon, Nov 23, 2020 at 04:55:26PM +0900, Bongsu Jeon wrote:
>  > >  examples:
>> > >    - |
>> > >      #include <dt-bindings/gpio/gpio.h>
>> > > @@ -71,3 +81,17 @@ examples:
>> > >              wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
>> > >          };
>> > >      };
>> > > +  # UART example on Raspberry Pi
>> > > +  - |
>> > > +    &uart0 {
>> > > +        status = "okay";
>> > > +
>> > > +        s3fwrn82_uart {
>> >
>> > Just "bluetooth" to follow Devicetree specification.
>> Sorry. I don't understand this comment.
>> Could you explain it?
>> Does it mean i need to refer to the net/broadcom-bluetooth.txt?
>
> The node name should be "bluetooth", not "s3fwrn82_uart", because of
> Devicetree naming convention - node names should represent generic class
> of a device.
>
Actually, RN82 is the nfc device.
So, is it okay to use the name as nfc instead of Bluetooth?

> Best regards,
> Krzysztof
>
>
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
