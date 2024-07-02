//
//  AppString+TermOfServices.swift
//  jinzai
//
//  Created by HieuNV on 30/06/2024.
//


import Foundation

extension AppString {
    enum TermOfServiceType: Int {
        case Text = 0
        case SectionHeader = 1
        case Header = 2
        case Separator = 3
        case TextIndent = 4
    }
    
    struct TermOfServiceString: Identifiable {
        var id = UUID()
        var type: TermOfServiceType
        var content: String?
        var indent: String?
        var isPadding: Bool = true
    }
    
    static let termOfService: [[TermOfServiceString]] = [
        [
            TermOfServiceString(
                type: .SectionHeader,
                content: "キャリオク利用規約"
            ),
            TermOfServiceString(
                type: .Text,
                content: "キャリオクご利用の前に、本利用規約をお読みいただいた上で、ご承諾くださいますようお願いいたします。キャリオクは、利用者が本利用規約の内容すべてに承諾することを条件として提供されるものです。なお、本件会員登録手続きに沿ってキャリオクに登録すると、イーキャリアFAにも登録されます。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第1条　キャリオク"
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "キャリオクとはSBヒューマンキャピタル株式会社（「当社」）が提供するインターネット上の転職マッチングサービス（https://kyarioku.jp）（「本サービス」）です。なお、キャリオクブランドにおいて当社が提供する特化型関連サービスを含みます。",
                indent: "1."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスに会員登録して匿名キャリアシートをキャリオクに登録・掲載（以下総称して「会員情報等」）することにより、求人企業から面接依頼を受けたり、採用条件のオークションを開催することが可能となります。",
                indent: "2."
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第2条　会員登録"
            ),
            TermOfServiceString(
                type: .Text,
                content: "本サービスをご利用になるには、本利用規約をよく読みその内容をすべて承諾された上で、本サービスの会員登録画面の指示に従って会員登録を完了することが必要です（本サービスの会員登録を完了された方を以下「会員」といいます）。登録にあたり登録画面にある同意ボタンを押した場合、登録をしようとする者が本利用規約の内容すべてに同意されたものとみなします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第3条　ID、パスワード、及びセキュリティ"
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員は、本サービスの利用に際し、会員が当社に登録したID及びパスワードを入力するものとします。会員のID及びパスワードの機密保持に関する責任は会員が負うものとします。さらに会員がID及びパスワードを用いて行うすべての活動に関する責任も会員が負うものとします。会員は自己のID及びパスワードを他人に使用させることはできません。当社は、会員があらかじめ入力したID及びパスワードと個々の利用時に入力したID及びパスワードとの一致を確認して取り扱いした場合には、なりすまし、ID及びパスワードの盗用その他会員以外の者の利用につき一切責任を負いません。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第4条　本サービス"
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスは、求職活動の場を提供することを目的とするものであり、面接の約束や仕事の提供を意味するものではありません。当社は、本サービスにより仕事が見つかることを保証するものではなく、これらが見つからなかったことに起因または派生する損害に対して一切責任を負いません。",
                indent: "1."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、本サービス上で使用提供される採用条件・企業情報（以下総称して「採用条件等」）の内容の正確性、有効性、信憑性、あるいは求人企業の信用性、契約締結能力、履行可能性、活動態様その他求人企業に関する事由について、監視、審査などの管理を一切行いません。当社は、求人企業と会員間の連絡、交渉、情報提供等の全てのやりとりには関与しません。当社は、求人企業と会員間のやりとりが確実に相手方に到達しているかどうか、求人企業が会員に対する連絡を行うかどうか等の管理を行いません。",
                indent: "2."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、会員が掲載したキャリアシート、アンケートその他会員に関する情報（以下総称して「キャリアシート等」）の内容または求人企業が会員に対し行う連絡の内容に関して、一切責任を負わず、本サービスに掲載されたキャリアシート等の内容確認や変更も一切行いません。ただし、",
                indent: "3."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "期限切れの記録を削除する場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービス運営のうえで削除が適切であると当社が判断した場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本利用規約の定めに会員が違反した場合、あるいは会員が会員登録の際に提供した情報に虚偽の事実が含まれていることが判明した場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "知的財産権その他の権利を保護するために行う場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "法令違反の場合、または他の会員や第三者の権利侵害を防止するために行う場合は、当社が必要と認めたときに限り、キャリアシート等の一部または全部を非掲載、修正、削除したり、会員に対して当該対応を求めたりすることができるものとします。これらの場合であっても、当社は、キャリアシート等を削除する義務を負わないものとします。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、会員と求人企業との間の紛争に関与する義務を一切負いません。会員は求人企業との間で紛争が生じた場合、そのような紛争あるいは本サービスにより発生するかそれに関係するあらゆる種類の請求、要求、債務、損害(直接損害か間接損害かを問いません)について、当社及びその管理者、役員、従業員、親会社、子会社、代理人及び承継人に対する請求を行うことができないものとします。",
                indent: "4."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は本サービスの全部または一部及び関連するサービスの提供をいつでも、その理由及び通知のいかんを問わず、直ちに停止または終了することができます。本サービス終了とともに、会員の本サービスを使用する権利も終了します。また、その場合、当社は、会員がID及びパスワードを入力することによりアクセスできる本サービスの専用ページ内にあるコンテンツを維持したり、未読あるいは未送信のメッセージを会員または第三者に転送する義務を負わないものとします。本サービスのご利用料金は不要ですが、本サービスにアクセスするための回線料金やプロバイダ費用等は全て会員のご負担となります。",
                indent: "5."
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第5条　会員情報等の保証"
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員は、本サービスに登録した会員情報等が他者の権利を侵害するものではないこと、および会員情報等の目的適合性、完全性、正確性、適法性、最新性、真実性を保証するものとします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第6条　問い合わせの受付"
            ),
            TermOfServiceString(
                type: .Text,
                content: "本サービスに関する質問等は当社指定の問い合わせフォームから行うものとします。ただし、回答は当社の裁量により対応するものとします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第7条　禁止行為"
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスの使用時には次のいかなる行為も無条件に禁止されています。",
                indent: "1."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "匿名または偽名で、本サービスを使用し、キャリアシート等を掲載したり、メッセージや情報を投稿しまたは送信すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "虚偽の内容を含むキャリアシート等を掲載したり、虚偽の内容を含むメッセージや情報を投稿しまたは送信すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "人で複数のアカウント登録をすること、複数人で１つのアカウントを共有すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "犯罪行為もしくは犯罪行為に結びつく行為、民事責任を発生させる行為、ハラスメント、ストーカー行為、脅迫その他、会員に適用される法令その他の法規に違反する行為もしくはそのおそれのある行為、他者の名誉または信用を毀損しあるいは誹謗中傷する行為もしくはそのおそれのある行為、わいせつ、賭博、暴力、残虐などの情報を送信する行為もしくはそのおそれのある行為、公序良俗に反する行為、その他当社が不適切と判断した行為",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "他者のプライバシーまたは個人情報を許可なく掲載または送信すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "ウィルス、ワーム等コンピューターを汚染しまたは破壊する恐れのある情報、ファイル及びソフトウェアを掲載または送信すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "著作権のある文書、画像あるいはプログラムであって使用許諾を得ていないもの、営業秘密その他財産的価値を有する機密情報、不法に使用されている商標あるいはサービスマークなど、他者の権利を侵害するメッセージ、データ、画像あるいはプログラムを掲載または送信すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "手段にかかわらず本サービスの運営を妨げ、あるいは本サービスの他の会員を妨害すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "他者に関する情報を承諾なく収集または開示すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本利用規約で認められる場合を除き、本サービスの他の会員のディレクトリ、あるいは本サービスの利用に関する情報、掲載情報の一部または全部を、使用し、ダウンロードその他の方法によりコピーし、または、本サービスの会員以外の個人または法人に有償無償を問わず提供すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "会員が送信または受領した本サービスにかかわるメッセージを他者に転送・開示すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "IDまたはパスワードの探知、ハッキングまたはその他の手段により、本サービス、他のアカウント、本サービスに接続されたコンピュータシステムまたはネットワークへの不法アクセスを試みること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスを介して技術データやソフトウェアの国外への送信に関する法令その他の適用法令に違反すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスを利用して、営業活動、営利を目的とした情報提供活動をおこなうこと。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、会員による本サービスの使用を監視し、もしくは使用のセッションの内容を保持する義務も負わないものとします。ただし、当社は法令、行政庁の監督、裁判所の命令等がある場合、または訴訟その他の法的手続きに関して必要がある場合、自己または第三者のために必要な情報を、いかなる時においても監視し、調査し、記録保存し、保有し、開示する権利を有します。",
                indent: "2."
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第8条　除名"
            ),
            TermOfServiceString(
                type: .Text,
                content: "当社は、会員が本利用規約および、当社が運営する他のサービスの利用規約に違反したと判断した場合、あるいは、本サービス登録後１年間以上ログインがない場合には、会員に事前に通知することなく、会員への本サービスの提供を中止し、会員を会員登録から除名することができます。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第9条　免責／責任の制限"
            ),
            TermOfServiceString(
                type: .Text,
                content: "本サービスに含まれ、または本サービスにより入手可能な情報及びサービスには、間違いや誤植が含まれることがあります。当社及び情報提供者はいつでも情報及びサービスを変更または削除できるものとします。当社は本サービスが停止もしくは中断されないこと、エラーがないこと、瑕疵が修正されること、あるいは本サービス及び本サービスを提供するサーバーにウィルスその他の有害な要素がないことを表明または保証するものではありません。当社は、本サービスにより入手可能なデータまたは情報が、正しいもの、正確なもの、時宜に適したもの、または信頼性のあるものであることを表明もしくは保証するものではありません。当社は、これらの事項につき事前もしくは事後に調査する責任を負わず、かつこれらの事項により会員に損害が発生しても一切損害賠償その他の責任を負わないものとします。また、理由のいかんを問わず、本サービスに関連してサーバーに蓄積されたデータ、情報もしくはメッセージなどの連絡事項が会員または第三者に送信されず、あるいは適時に到達しない場合があることを会員には予めご承諾頂くものとします。当社は、上記データ、情報または連絡事項が、正確なもの、時宜に適したもの、または信頼性のあるものであること、並びにこれらが会員または第三者の要請に従って、常に送信されるものであることを表明もしくは保証するものではありません。当社は、本サービスの使用もしくは使用の結果会員に損害が発生しても一切損害賠償その他の責任を負わないものとします。消費者契約法その他の法律により、本条の免責事項が無効と判断された場合であっても、当社が負担すべき損害賠償の範囲は、本条に記載の事項が当社の責に帰すべき事由により発生した場合に会員が被った直接損害に限られるものとします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第10条　補償"
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員は、会員の故意または過失による、本サービスの使用または本サービス上の行為により生じた、第三者によるいかなる請求、要求、または損害についても、当社、その親会社、子会社、関係会社、役員、及び従業員を防御し、これにより生じた損害及び一切の費用（弁護士費用を含みます。)を補償するものとします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第11条　個人情報の取り扱い"
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "定義\n「個人情報」とは、氏名、住所、電話番号など個人を識別することのできる情報（他の情報と容易に照合することができ、それにより特定の個人を識別できるものも含みます。）を言います。",
                indent: "1."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "利用目的\n当社が本サービス提供にあたり取得する個人情報の利用目的は以下の通りです。",
                indent: "2."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスの提供のため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社によるユーザ管理のため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスに関するユーザーサポート及び当社からの連絡手段等のため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "ご意見、ご要望、お問合せに回答するため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "電子メール、郵送等により当社のサービスに関する更新情報、新商品情報、キャンペーン情報、アンケート等をご案内するため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "各種キャンペーンの当選通知およびプレゼント等の発送のため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "コンテンツ記事作成等における取材対象者の募集のため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "サービスの機能開発、コンテンツ企画等、会員の利便性を高めることを目的とした情報のデータベース化のため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .Text,
                content: "なお、必須項目と定める個人情報をご提供いただけない場合には、サービスをご提供できませんのでご了承下さい。",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "第三者への非開示\n当社は、原則として、会員の個人情報を第三者に対して開示または提供することは致しません。但し、会員が求人企業からの面接依頼や入札を承諾した場合及び次のいずれかに該当する場合にはこの限りではないものとします。",
                indent: "3."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "会員本人の同意を得た場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "人の生命、身体、財産の保護のために必要がある場合であって、会員本人の同意を得ることが困難である場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "国の機関若しくは地方公共団体またはその委託を受けた者が法令の定める事務を遂行することに対して協力する必要がある場合であって、会員本人の同意を得ることにより当該事務の遂行に支障を及ぼすおそれがある場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "その他の法令により開示または提供が許容されている場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "個人情報を提供した会員本人から明示的に第三者への開示または提供を求められた場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "統計的なデータなど個人を識別することのできない状態で開示・提供する場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員が本サービスの機能またはその他の手段を用いて、特定の企業に応募するために個人情報を明らかにした場合、その個人情報は当該企業によって管理されるものとなり、当社は何らの責任を負いません。なお、求人企業はその採用業務を第三者に委託している場合があります。当社は求人企業に対し採用業務委託の有無の確認や管理を行いません。",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "個人情報の委託\n当社は、情報処理やメンテナンス等、業務上の必要性により、会員の個人情報を外部に委託する場合があります。委託先については、個人情報取り扱いの安全性確認、秘密保持契約の締結等、適切な管理を行っています。",
                indent: "4."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "個人情報に関する問合せ\n個人情報に関するお問合せは、当社プライバシー事務局までお申し出ください。\n事業者名：SBヒューマンキャピタル株式会社\n個人情報保護管理者：個人情報管理責任者（CPO）\n連絡先(E-mail）： privacy-sbhc@ecareer.ne.jp （プライバシー事務局）",
                indent: "5."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "開示等のお求めについて\n個人情報の開示、訂正、利用停止等のお求めの際は、当社プライバシー事務局宛に当社指定の申請書と本人確認書類の提出をお願いしております。詳細は こちらをご覧ください。 ※ご自身で登録された情報は全て、ログイン後の専用ページで随時閲覧・修正が可能です。",
                indent: "6."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "情報セキュリティポリシーについて\n当社の情報セキュリティポリシーについてはこちらをご覧ください。",
                indent: "7."
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第12条　提供された情報の当社による利用について"
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員は、本サービスに関連して会員が当社に提供した就職活動に関係する情報内容（「提供情報」）を、当社及びその親会社、子会社、関係会社、提携会社が編集または発行、発売するものに転載することを了承するものとします。また、この場合の提供情報の著作権（著作権法第27条及び28条に定める翻訳権、翻案権、二次的著作物に関する権利を含みます）は、当社に帰属するものとします。ただし、この場合、当社は法律により認められている場合を除き、会員の承諾なくして、当該会員の個人情報を開示しないものとします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第13条　会員登録の取消"
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員は、採用決定などの事情により、本サービスの登録変更画面を通じて、自由に会員登録を取消しできるものとします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第14条　本利用規約の変更"
            ),
            TermOfServiceString(
                type: .Text,
                content: "当社は事前の告知なく、本利用規約を随時変更することができるものとします。この場合、会員には変更後の利用規約が適用されます。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第15条　専属合意管轄裁判所"
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員と当社との間で訴訟の必要が生じた場合、東京地方裁判所を第一審の専属的合意管轄裁判所とします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第16条　準拠法"
            ),
            TermOfServiceString(
                type: .Text,
                content: "本規約の準拠法は日本法とします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第17条　付則"
            ),
            TermOfServiceString(
                type: .Text,
                content: "本規約は2019年1月15日制定しました。\n本規約は2022年4月1日改訂しました。\n本規約は2023年7月26日改訂しました。"
            ),
        ],
        [
            TermOfServiceString(
                type: .SectionHeader,
                content: "イーキャリアFA利用規約"
            ),
            TermOfServiceString(
                type: .Text,
                content: "イーキャリアFAご利用の前に、本利用規約をお読みいただいた上で、ご承諾くださいますようお願いいたします。イーキャリアFAは、利用者が本利用規約の内容すべてに承諾することを条件として提供されるものです。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第1条 イーキャリアFA"
            ),
            TermOfServiceString(
                type: .Text,
                content: "イーキャリアFAとはSBヒューマンキャピタル株式会社（「当社」）が提供する以下のサービス（下記(1)(2)(3)を総称して「本サービス」といいます）をいいます。"
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "インターネット上の就職情報提供サービス（http://www.ecareerfa.jp）",
                indent: "1.",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "キャリアシートを職業紹介会社に対して匿名公開し、スカウトを受けるサービス",
                indent: "2.",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "求人企業の求人内容に関する情報提供、転職相談に関する面談の実施、求人企業への利用者の推薦および採用面接の日程調整等の職業紹介サービス",
                indent: "3.",
                isPadding: false
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第2条 会員登録"
            ),
            TermOfServiceString(
                type: .Text,
                content: "本サービスをご利用になるには、本利用規約をよく読みその内容をすべて承諾された上で、本サービスの会員登録画面の指示に従って会員登録を完了することが必要です（本サービスの会員登録を完了された方を以下「会員」といいます）。登録にあたり登録画面にある同意ボタンを押した場合、登録をしようとする者が本利用規約の内容すべてに同意されたものとみなします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第3条 ID、パスワード、及びセキュリティ"
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員は、本サービスの利用に際し、会員が当社に登録したID及びパスワードを入力するものとします。会員のID及びパスワードの機密保持に関する責任は会員が負うものとします。さらに会員がID及びパスワードを用いて行うすべての活動に関する責任も会員が負うものとします。会員は自己のID及びパスワードを他人に使用させることはできません。当社は、会員があらかじめ入力したID及びパスワードと個々の利用時に入力したID及びパスワードとの一致を確認して取り扱いした場合には、なりすまし、ID及びパスワードの盗用その他会員以外の者の利用につき一切責任を負いません。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第4条 本サービス"
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスは、求職活動の場を提供することを目的とするものであり、面接の約束や仕事の提供を意味するものではありません。当社は、本サービスにより仕事が見つかることを保証するものではなく、これらが見つからなかったことに起因または派生する損害に対して一切責任を負いません。",
                indent: "1."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、本サービス上で使用提供される採用条件・企業情報（以下総称して「採用条件等」）の内容の正確性、有効性、信憑性、あるいは求人企業の信用性、契約締結能力、履行可能性、活動態様その他求人企業に関する事由について、監視、審査などの管理を一切行いません。当社は、求人企業と会員間の連絡、交渉、情報提供等の全てのやりとりには関与しません。当社は、求人企業と会員間のやりとりが確実に相手方に到達しているかどうか、求人企業が会員に対する連絡を行うかどうか等の管理を行いません。",
                indent: "2."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、会員が掲載したキャリアシート、アンケートその他会員に関する情報（以下総称して「キャリアシート等」）の内容または求人企業が会員に対し行う連絡の内容に関して、一切責任を負わず、本サービスに掲載されたキャリアシート等の内容確認や変更も一切行いません。ただし、",
                indent: "3."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "期限切れの記録を削除する場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービス運営のうえで削除が適切であると当社が判断した場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本利用規約の定めに会員が違反した場合、あるいは会員が会員登録の際に提供した情報に虚偽の事実が含まれていることが判明した場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "知的財産権その他の権利を保護するために行う場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "法令違反の場合、または他の会員や第三者の権利侵害を防止するために行う場合は、当社が必要と認めたときに限り、キャリアシート等の一部または全部を非掲載、修正、削除したり、会員に対して当該対応を求めたりすることができるものとします。これらの場合であっても、当社は、キャリアシート等を削除する義務を負わないものとします。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、会員と求人企業との間の紛争に関与する義務を一切負いません。会員は求人企業との間で紛争が生じた場合、そのような紛争あるいは本サービスにより発生するかそれに関係するあらゆる種類の請求、要求、債務、損害(直接損害か間接損害かを問いません)について、当社及びその管理者、役員、従業員、親会社、子会社、代理人及び承継人に対する請求を行うことができないものとします。",
                indent: "4."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は本サービスの全部または一部及び関連するサービスの提供をいつでも、その理由及び通知のいかんを問わず、直ちに停止または終了することができます。本サービス終了とともに、会員の本サービスを使用する権利も終了します。また、その場合、当社は、会員がID及びパスワードを入力することによりアクセスできる本サービスの専用ページ内にあるコンテンツを維持したり、未読あるいは未送信のメッセージを会員または第三者に転送する義務を負わないものとします。本サービスのご利用料金は不要ですが、本サービスにアクセスするための回線料金やプロバイダ費用等は全て会員のご負担となります。",
                indent: "5."
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第5条 禁止行為"
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスの使用時には次のいかなる行為も無条件に禁止されています。",
                indent: "1."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "匿名または偽名で、本サービスを使用し、キャリアシート等を作成し応募したり、メッセージや情報を投稿しまたは送信すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "虚偽の内容を含むキャリアシート等を作成し応募したり、虚偽の内容を含むメッセージや情報を投稿しまたは送信すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "犯罪行為もしくは犯罪行為に結びつく行為、民事責任を発生させる行為、ハラスメント、ストーカー行為、脅迫その他、会員に適用される法令その他の法規に違反する行為もしくはそのおそれのある行為、他者の名誉または信用を毀損しあるいは誹謗中傷する行為もしくはそのおそれのある行為、わいせつ、賭博、暴力、残虐などの情報を送信する行為もしくはそのおそれのある行為、公序良俗に反する行為、その他当社が不適切と判断した行為",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "他者のプライバシーまたは個人情報を許可なく掲載または送信すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "ウィルス、ワーム等コンピューターを汚染しまたは破壊する恐れのある情報、ファイル及びソフトウェアを掲載または送信すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "著作権のある文書、画像あるいはプログラムであって使用許諾を得ていないもの、営業秘密その他財産的価値を有する機密情報、不法に使用されている商標あるいはサービスマークなど、他者の権利を侵害するメッセージ、データ、画像あるいはプログラムを掲載または送信すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "手段にかかわらず本サービスの運営を妨げ、あるいは本サービスの他の会員を妨害すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "他者に関する情報を承諾なく収集または開示すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本利用規約で認められる場合を除き、本サービスの他の会員のディレクトリ、あるいは本サービスの利用に関する情報、掲載情報の一部または全部を、使用し、ダウンロードその他の方法によりコピーし、または、本サービスの会員以外の個人または法人に有償無償を問わず提供すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "IDまたはパスワードの探知、ハッキングまたはその他の手段により、本サービス、他のアカウント、本サービスに接続されたコンピュータシステムまたはネットワークへの不法アクセスを試みること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスを介して技術データやソフトウェアの国外への送信に関する法令その他の適用法令に違反すること。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスを利用して、営業活動、営利を目的とした情報提供活動をおこなうこと。",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、会員による本サービスの使用を監視し、もしくは使用のセッションの内容を保持する義務も負わないものとします。ただし、当社は法令、行政庁の監督、裁判所の命令等がある場合、または訴訟その他の法的手続きに関して必要がある場合、自己または第三者のために必要な情報を、いかなる時においても監視し、調査し、記録保存し、保有し、開示する権利を有します。",
                indent: "2."
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第6条 除名"
            ),
            TermOfServiceString(
                type: .Text,
                content: "当社は、会員が本利用規約に違反したと判断した場合は、会員に事前に通知することなく、会員への本サービスの提供を中止し、会員を会員登録から除名することができます。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第7条 免責／責任の制限"
            ),
            TermOfServiceString(
                type: .Text,
                content: "本サービスに含まれ、または本サービスにより入手可能な情報及びサービスには、間違いや誤植が含まれることがあります。当社及び情報提供者はいつでも情報及びサービスを変更または削除できるものとします。当社は本サービスが停止もしくは中断されないこと、エラーがないこと、瑕疵が修正されること、あるいは本サービス及び本サービスを提供するサーバーにウィルスその他の有害な要素がないことを表明または保証するものではありません。当社は、本サービスにより入手可能なデータまたは情報が、正しいもの、正確なもの、時宜に適したもの、または信頼性のあるものであることを表明もしくは保証するものではありません。当社は、これらの事項につき事前もしくは事後に調査する責任を負わず、かつこれらの事項により会員に損害が発生しても一切損害賠償その他の責任を負わないものとします。また、理由のいかんを問わず、本サービスに関連してサーバーに蓄積されたデータ、情報もしくはメッセージなどの連絡事項が会員または第三者に送信されず、あるいは適時に到達しない場合があることを会員には予めご承諾頂くものとします。当社は、上記データ、情報または連絡事項が、正確なもの、時宜に適したもの、または信頼性のあるものであること、並びにこれらが会員または第三者の要請に従って、常に送信されるものであることを表明もしくは保証するものではありません。当社は、本サービスの使用もしくは使用の結果会員に損害が発生しても一切損害賠償その他の責任を負わないものとします。消費者契約法その他の法律により、本条の免責事項が無効と判断された場合であっても、当社が負担すべき損害賠償の範囲は、本条に記載の事項が当社の責に帰すべき事由により発生した場合に会員が被った直接損害に限られるものとします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第8条 補償"
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員は、会員の故意または過失による、本サービスの使用または本サービス上の行為により生じた、第三者によるいかなる請求、要求、または損害についても、当社、その親会社、子会社、関係会社、役員、及び従業員を防御し、これにより生じた損害及び一切の費用（弁護士費用を含みます。)を補償するものとします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第9条 個人情報の取り扱い"
            ),
            TermOfServiceString(
                type: .Text,
                content: "1.(定義)\n「個人情報」とは、氏名、住所、電話番号など個人を識別することのできる情報（他の情報と容易に照合することができ、それにより特定の個人を識別できるものも含みます。）を言います。"
            ),
            TermOfServiceString(
                type: .Text,
                content: "1.(利用目的)\n当社が本サービス提供にあたり取得する個人情報の利用目的は以下の通りです。"
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスの提供のため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "会員と掲載企業の適切なマッチングを目的としたスカウトサービス実施のため（サービスの利用は会員の選択によります。）",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社によるユーザ管理のため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "本サービスに関するユーザーサポート、及び当社からの連絡手段等のため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "ご意見、ご要望、お問合せに回答するため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "電子メール、郵送等により当社のサービスに関する更新情報、新商品情報、キャンペーン情報、アンケート等をご案内するため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "各種キャンペーンの当選通知およびプレゼント等の発送のため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "コンテンツ記事作成等における取材対象者の募集のため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "サービスの機能開発、コンテンツ企画等、会員の利便性を高めることを目的とした情報のデータベース化のため",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .Text,
                content: "なお、必須項目と定める個人情報をご提供いただけない場合には、サービスをご提供できませんのでご了承下さい。",
                isPadding: false
            ),
            TermOfServiceString(
                type: .Text,
                content: "3.(第三者への非開示)\n当社は、原則として、会員の個人情報を第三者に対して開示または提供することは致しません。但し、会員が掲載企業に対しキャリアシートを公開する場合及び次のいずれかに該当する場合にはこの限りではないものとします。"
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "会員本人の同意を得た場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "人の生命、身体、財産の保護のために必要がある場合であって、会員本人の同意を得ることが困難である場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "国の機関若しくは地方公共団体またはその委託を受けた者が法令の定める事務を遂行することに対して協力する必要がある場合であって、会員本人の同意を得ることにより当該事務の遂行に支障を及ぼすおそれがある場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "その他の法令により開示または提供が許容されている場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "個人情報を提供した会員本人から明示的に第三者への開示または提供を求められた場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "統計的なデータなど個人を識別することのできない状態で開示・提供する場合",
                indent: "・",
                isPadding: false
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員が本サービスの機能またはその他の手段を用いて、特定の企業に応募するために個人情報を明らかにした場合、その個人情報は当該企業によって管理されるものとなり、当社は何らの責任を負いません。なお、掲載企業はその採用業務を第三者に委託している場合があります。当社は掲載企業に対し採用業務委託の有無の確認や管理を行いません。",
                isPadding: false
            ),
            TermOfServiceString(
                type: .Text,
                content: "4.(個人情報の委託)\n当社は、情報処理やメンテナンス等、業務上の必要性により、会員の個人情報を外部に委託する場合があります。委託先については、個人情報取り扱いの安全性確認、秘密保持契約の締結等、適切な管理を行っています。"
            ),
            TermOfServiceString(
                type: .Text,
                content: "5.(個人情報に関する問合せ)\n個人情報に関するお問合せは、当社プライバシー事務局までお申し出ください。\n事業者名：SBヒューマンキャピタル株式会社\n個人情報保護管理者：個人情報管理責任者（CPO）\n連絡先（E-mail）： privacy-sbhc@ecareer.ne.jp （プライバシー事務局）"
            ),
            TermOfServiceString(
                type: .Text,
                content: "6.(開示等のお求めについて)\n個人情報の開示、訂正、利用停止等のお求めの際は、当社プライバシー事務局宛に当社指定の申請書と本人確認書類の提出をお願いしております。詳細は こちらをご覧ください。 ※ご自身で登録された情報は全て、ログイン後の専用ページで随時閲覧・修正が可能です。"
            ),
            TermOfServiceString(
                type: .Text,
                content: "7.情報セキュリティポリシーについて\n当社の情報セキュリティポリシーについてはこちらをご覧ください。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第10条 提供された情報の当社による利用について"
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員は、本サービスに関連して会員が当社に提供した就職活動に関係する情報内容（「提供情報」）を、当社及びその親会社、子会社、関係会社、提携会社が編集または発行、発売するものに転載することを了承するものとします。また、この場合の提供情報の著作権（著作権法第27条及び28条に定める翻訳権、翻案権、二次的著作物に関する権利を含みます）は、当社に帰属するものとします。ただし、この場合、当社は法律により認められている場合を除き、会員の承諾なくして、当該会員の個人情報を開示しないものとします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第11条 会員登録の取消"
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員は、採用決定などの事情により、本サービスの登録変更画面を通じて、自由に会員登録を取消しできるものとします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第12条 本利用規約の変更"
            ),
            TermOfServiceString(
                type: .Text,
                content: "当社は事前の告知なく、本利用規約を随時変更することができるものとします。この場合、会員には変更後の利用規約が適用されます。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第13条 専属合意管轄裁判所"
            ),
            TermOfServiceString(
                type: .Text,
                content: "会員と当社との間で訴訟の必要が生じた場合、東京地方裁判所を第一審の専属的合意管轄裁判所とします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第14条 準拠法"
            ),
            TermOfServiceString(
                type: .Text,
                content: "本規約の準拠法は日本法とします。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第15条 付則"
            ),
            TermOfServiceString(
                type: .Text,
                content: "本利用規約は2007年11月1日、改定しました。\n本利用規約は2015年1月15日、改定しました。\n本利用規約は2016年2月8日改定しました。\n本利用規約は2022年4月1日改訂しました。"
            ),
        ],
        [
            TermOfServiceString(
                type: .SectionHeader,
                content: "イーキャリアFA　スマートフォンによる情報送出について"
            ),
            TermOfServiceString(
                type: .Header,
                content: "第1条（個人情報の取得等）"
            ),
            TermOfServiceString(
                type: .Text,
                content: "本サービスは、本サービスをご利用の際、利用者が当社サービス等をご利用いただくことに伴い当社が取得した、氏名、住所、電話番号、メールアドレス等を当社に送出します。当社は、これらの情報について、本規約および別途当社が定めるプライバシーポリシーに従い、取り扱います。"
            ),
            TermOfServiceString(
                type: .Separator
            ),
            TermOfServiceString(
                type: .Header,
                content: "第2条（通信機器固有IDおよび行動履歴等の情報の利用）"
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、本サービスを提供するにあたって、利用者が当社サービス等をご利用いただくことに伴取得した、通信機器固有ID（通信機器本体等に関する情報（製造番号、機種名、品番等）、コンテンツの行動履歴情報（閲覧履歴等）、位置情報、通信環境に関する技術情報等の情報を取得することがあります。当社は、当社が取得するこれらの情報について、本規約に従い、取り扱います。",
                indent: "1."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、第1項の規定に基づいて当社が取得する行動履歴等の情報を、前条の規定に基づいて当社が取得する利用者の個人情報とは別個に取り扱います。また、当社は、これらの別箇に取り扱う情報について、会社内外で相互に交換、照合、その他の方法により関連付けることはできません。",
                indent: "2."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、第1項の規定に基づいて当社が取得する行動履歴等の情報を、個人情報と関連付けない状態でマーケティング情報等の統計分析の資料として利用、販売等する場合がございます。",
                indent: "3."
            ),
            TermOfServiceString(
                type: .Separator
            ),
            
            TermOfServiceString(
                type: .Header,
                content: "第3条（取得する情報の利用目的）"
            ),
            TermOfServiceString(
                type: .Text,
                content: "当社は、前2条の規定に基づいて取得する情報について、以下に定める目的に従って利用いたします。なお、前2条の規定に基づいて取得した情報を、本条に定める目的以外の目的で利用する場合には、その都度、その利用目的を明らかにした上で、利用者から事前の同意をいただきます。"
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、前2条の規定に基づいて取得する情報について、以下に定める目的に従って利用いたします。なお、前2条の規定に基づいて取得した情報を、本条に定める目的以外の目的で利用する場合には、その都度、その利用目的を明らかにした上で、利用者から事前の同意をいただきます。",
                indent: "1."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "利用者の利便性向上、品質改善および有益なサービスの提供を目的として、利用状況の分析、効果測定、その他各種マーケティング調査および分析を行うため並びに個人が識別できない状態でそれらの第三者への提供のため",
                indent: "2."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社および協業する会社のサービス等のご案内のため",
                indent: "3."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "紛争および訴訟等の対応のため",
                indent: "4."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社が提供する特典の適用の有無を識別するため",
                indent: "5."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "コンテンツ提供者との間において、料金支払いおよび売上金の分配額を計算するため",
                indent: "6."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社サービスの不正契約・不正利用（不正ID取得）の防止および発生時に調査等を行うため",
                indent: "7."
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "その他、当社サービスの提供に必要な業務のため",
                indent: "8."
            ),
            TermOfServiceString(
                type: .Separator
            ),
            
            TermOfServiceString(
                type: .Header,
                content: "第4条（アプリケーションの利用）"
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社は、アプリケーションの提供にあたり、個人情報、通信機器固有ID（通信機器本体等に関する情報（製造番号、機種名、品番等）および行動履歴等の送出が必要な場合に、取得の同意が得られない場合は、本アプリケーションの利用を制限する場合または提供を見合わせる場合がございます。",
                indent: "1.",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "当社が定めた利用期間および方法で、日本国内に限りコンテンツを利用することができます。",
                indent: "2.",
                isPadding: false
            ),
            TermOfServiceString(
                type: .TextIndent,
                content: "ユーザーは、個人的な利用のみを目的としてコンテンツを閲覧するものとし、商業目的などで不特定多数にコンテンツを閲覧させることや、コンテンツを譲渡、複製、貸与、公衆送信などすること、またはこれらの行為を第三者に行わせることはできません。",
                indent: "3.",
                isPadding: false
            ),
        ]
    ]
}
