//
//  ContentView.swift
//  HW5
//
//  Created by 114iosClassStudent04 on 2025/11/10.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State private var total = 0
    @State private var select:[Question] = []
    @State private var gameover = false
    let LiteratureQuestion: [Question] = [
        Question(text: "What is a metaphysical conceit?", options: ["A simple comparison", "An extended elaborate metaphor", "A type of rhyme scheme", "A poetic meter"], answer: "An extended elaborate metaphor"),
        Question(text: "In 'A Valediction: Forbidding Mourning', Donne compares lovers to:", options: ["Two stars", "Compass legs", "Twin flames", "Birds in flight"], answer: "Compass legs"),
        Question(text: "What insect does Donne use as a seduction argument in his poetry?", options: ["A butterfly", "A bee", "A flea", "A moth"], answer: "A flea"),
        Question(text: "'Death Be Not Proud' is part of Donne's:", options: ["Love poems", "Holy Sonnets", "Satires", "Elegies"], answer: "Holy Sonnets"),
        Question(text: "'No man is an island' comes from Donne's:", options: ["Songs and Sonnets", "The Flea", "Meditation XVII", "The Canonization"], answer: "Meditation XVII"),
        Question(text: "What position did Donne hold later in life?", options: ["Bishop of London", "Dean of St. Paul's Cathedral", "Archbishop of Canterbury", "Court poet"], answer: "Dean of St. Paul's Cathedral"),
        Question(text: "The two major periods of Donne's poetry are:", options: ["Youth and old age", "Secular love and religious", "War and peace", "Nature and city"], answer: "Secular love and religious"),
        Question(text: "'In Batter My Heart,' Donne asks God to:", options: ["Comfort him gently", "Leave him alone", "Imprison and ravish him", "Guide him softly"], answer: "Imprison and ravish him"),
        Question(text: "George Herbert's poetry collection is called:", options: ["The Temple", "The Church", "Sacred Songs", "Divine Meditations"], answer: "The Temple"),
        Question(text: "'Easter Wings'is an example of:", options: ["Free verse", "Pattern/concrete poetry", "Epic poetry", "Blank verse"], answer: "Pattern/concrete poetry"),
        Question(text: "In 'The Collar,' Herbert ends with submission when he hears:", options: ["Church bells", "God calling him 'Child'", "His conscience", "An angel's voice"], answer: "God calling him 'Child'"),
        Question(text: "What shape does Herbert's 'The Altar' take on the page?", options: ["A cross", "An altar", "A heart", "A church"], answer: "An altar"),
        Question(text: "Herbert's poetry is generally more _____ than Donne's:", options: ["Intellectual", "Dramatic", "Serene and devotional", "Witty"], answer: "Serene and devotional"),
        Question(text: "What was Herbert's profession?", options: ["University professor", "Country parson", "Court chaplain", "Bishop"], answer: "Country parson"),
        Question(text: "Crashaw's poetry is characterized by:", options: ["Puritan simplicity", "Baroque ornamentation", "Classical restraint", "Political themes"], answer: "Baroque ornamentation"),
        Question(text: "Crashaw's most famous work is:", options: ["The Weeper", "The Flaming Heart", "Sacred Hymns", "Divine Ecstasy"], answer: "The Flaming Heart"),
        Question(text: "What religion did Crashaw convert to?", options: ["Anglicanism", "Puritanism", "Roman Catholicism", " Presbyterianism"], answer: "Roman Catholicism"),
        Question(text: "'To His Coy Mistress' is what type of poem?", options: ["Elegy", "Carpe diem", "Pastoral", "Sonnet"], answer: "Carpe diem"),
        Question(text: "The famous opening line 'Had we but world enough, and time' is from:", options: ["The Garden", "The Definition of Love", "To His Coy Mistress", "Bermudas"], answer: "To His Coy Mistress"),
        Question(text: "'The Garden' celebrates:", options: ["Romantic love", "Solitude and contemplation", "Agricultural labor", " Court life"], answer: "Solitude and contemplation"),
        Question(text: "Marvell served as Latin Secretary to:", options: ["Charles I", "Charles II", "Oliver Cromwell", "James II"], answer: "Oliver Cromwell"),
        Question(text: "'An Horatian Ode' commemorates Cromwell's return from:", options: ["Scotland", " Ireland", " France", "Holland"], answer: "Ireland"),
        Question(text: "Cavalier poets were known as:", options: ["Sons of Shakespeare", "Sons of Ben", "The King's Men", " Court Singers"], answer: "Sons of Ben"),
        Question(text: "'Drink to me only with thine eyes' is from Jonson's poem:", options: ["To Penshurst", "On My First Son", "To Celia", "Inviting a Friend to Supper"], answer: "To Celia"),
        Question(text: "'On My First Son' is an elegy for Jonson's son who died at age:", options: ["Five", " Seven", "Ten", "Twelve"], answer: "Seven"),
        Question(text: "Jonson's classical models were primarily:", options: ["Greek poets", "Roman poets", "Italian poets", "France poets"], answer: "Roman poets"),
        Question(text: "'To Penshurst' is an example of:", options: ["Love lyric", "Country house poem", "Pastoral elegy", "Metaphysical conceit"], answer: "Country house poem"),
        Question(text: "Jonson perfected the comedy of:", options: ["Manners", "Errors", "Humours", "Sentiments"], answer: "Humours"),
        Question(text: "'To Lucasta, Going to the Wars' balances:", options: ["Love and honor", "War and peace", "Faith and doubt", "Youth and age"], answer: "Love and honor"),
        Question(text: "I could not love thee, dear, so much, / Loved I not _____ more:", options: ["God", "Country", "Honor", "Freedom"], answer: "Honor"),
        Question(text: "'Stone walls do not a prison make' is from:", options: ["To Lucasta", "To Althea, from Prison", "The Vintage to the Dungeon", " The Grasshopper"], answer: "To Althea, from Prison"),
        Question(text: "Lovelace was imprisoned for supporting:", options: [" Parliament", "Oliver Cromwell", "Charles I ", "The Puritans"], answer: "Oliver Cromwell"),
        Question(text: "Herrick's major collection is called:", options: [" Noble Numbers", "Hesperides", "Sacred Poems", "Secular Verses"], answer: "Hesperides"),
        Question(text: "'Gather ye rosebuds while ye may' begins:", options: ["Corinna's Going A-Maying", " Delight in Disorder", " To the Virgins, to Make Much of Time", "Upon Julia's Clothes"], answer: " To the Virgins, to Make Much of Time"),
        Question(text: "Herrick's collection of religious verse is called:", options: ["Hesperides", "Noble Numbers", "Sacred Songs", "Divine Poems"], answer: "Noble Numbers"),
        Question(text: "'Delight in Disorder' praises:", options: ["Perfect order", "Sweet disorder in dress", " Wild abandon", "Classical symmetry"], answer: "Sweet disorder in dress"),
        Question(text: "Herrick served as:", options: ["Court poet", "University professor", "Anglican vicar", "Bishop"], answer: "Anglican vicar"),
        Question(text: "Filmer's most important work is:", options: ["Leviathan", "Patriarcha", "Two Treatises", " The Prince"], answer: "Patriarcha"),
        Question(text: "Filmer argued that political authority derives from:", options: [" Social contract", " Divine right and paternal authority", "Popular consent", "Natural law"], answer: "Divine right and paternal authority"),
        Question(text: "Who systematically refuted Filmer's arguments?", options: ["Thomas Hobbes", "John Milton", "John Locke", "Edmund Burke"], answer: "John Locke"),
        Question(text: "Filmer compared royal authority to:", options: ["Military command", "A father's authority", " Religious leadership", " Judicial power"], answer: "A father's authority"),
        Question(text: "Hobbes's most famous work is:", options: [" Patriarcha", "Two Treatises of Government", "Leviathan", "The Social Contract"], answer: "Leviathan"),
        Question(text: "In Hobbes's state of nature, life is:", options: ["Peaceful and harmonious", "Solitary, poor, nasty, brutish, and short","Governed by reason", "Idyllic and free"], answer: "Solitary, poor, nasty, brutish, and short"),
        Question(text: "Hobbes's social contract requires surrendering freedom to:", options: ["The church", " A sovereign power", "The people", "Natural law"], answer: "A sovereign power"),
        Question(text: "Hobbes favored what form of government?", options: ["Democracy", "Absolute sovereignty", "Constitutional monarchy", "Republic"], answer: "Absolute sovereignty"),
        Question(text: "What event motivated Hobbes's political philosophy?", options: ["The Glorious Revolution", " The English Civil War", "The Restoration", "The Reformation"], answer: "The English Civil War"),
        Question(text: "The 'Leviathan' represents:", options: ["The church", "Natural chaos", "The powerful state", "Individual freedom"], answer: "The powerful state"),
        Question(text: "Locke's most influential political work is:", options: ["Leviathan", "Essay Concerning Human Understanding", "Two Treatises of Government", " Letter Concerning Toleration"], answer: "Two Treatises of Government"),
        Question(text: "Locke's natural rights are:", options: ["Life, liberty, and property", "Life, liberty, and happiness", "Freedom, equality, and justice", "Peace, security, and order"], answer: "Life, liberty, and property"),
        Question(text: "Locke's state of nature is governed by:", options: ["Chaos and violence", "Natural law and reason", "Survival of the fittest", "Divine command"], answer: "Natural law and reason"),
        Question(text: "According to Locke, government legitimacy depends on:", options: ["Divine right", " Military power", "Popular consent", "Tradition"], answer: "Popular consent"),
        Question(text: "Locke justified what historical event?", options: ["The Glorious Revolution", " The English Civil War", "The Glorious Revolution of 1688", " The Exclusion Crisis"], answer: "The Glorious Revolution of 1688"),
        Question(text: "Locke argued people acquire property through:", options: ["Conquest", "Mixing labor with nature", "Inheritance only", "Royal grant"], answer: "Mixing labor with nature"),
        Question(text: "In 'Essay Concerning Human Understanding,' Locke described the mind as:", options: ["Innately rational", "A blank slate (tabula rasa)", "Divinely inspired", "Naturally corrupt"], answer: "A blank slate (tabula rasa)"),
        Question(text: "Locke's ideas most influenced:", options: ["The French monarchy", "America's Founding Fathers", "The Spanish Empire", "The Roman Catholic Church"], answer: "America's Founding Fathers"),
        Question(text: "Milton became completely blind by:", options: ["1642", "1652", "1662", "1672"], answer: "1652"),
        Question(text: "Milton served as Latin Secretary under:", options: ["Charles I", " Charles II", "Oliver Cromwell", "James II"], answer: "Oliver Cromwell"),
        Question(text: "During the English Civil War, Milton supported:", options: ["The Royalists", "Parliament and Cromwell", " Neutrality", "The Scots"], answer: "Parliament and Cromwell"),
        Question(text: "After the Restoration, Milton was:", options: [" Executed", "Exiled permanently", "Briefly imprisoned then pardoned", "Made poet laureate"], answer: "Briefly imprisoned then pardoned"),
        Question(text: "'Paradise Lost' is about:", options: ["The Crucifixion", "The Fall of Man", "The Last Judgment", "Noah's Flood"], answer: "The Fall of Man"),
        Question(text: "Milton's stated purpose is to:", options: ["Entertain readers", "Justify the ways of God to men", "Condemn Satan", "Praise England"], answer: "Justify the ways of God to men"),
        Question(text: "'Better to reign in Hell, than serve in Heav'n' is said by:", options: ["Adam", "Eve", "Satan", "Beelzebub"], answer: "Satan"),
        Question(text: "Milton invokes which muse in 'Paradise Lost'?", options: ["Calliope", "Clio", "The Holy Spirit (Urania)", "Melpomene"], answer: "The Holy Spirit (Urania)"),
        Question(text: "'Paradise Lost' originally had how many books?", options: ["7", "10", "12", "14"], answer: "10"),
        Question(text: "The climax of 'Paradise Lost'occurs when:", options: ["Satan is cast out of Heaven", "  Eve eats the forbidden fruit", " The Flood begins", "Christ is born"], answer: " Eve eats the forbidden fruit"),
        Question(text: "Adam and Eve leave Eden with:", options: ["Despair", "Anger at God", "Providence as their guide", " Satan following them"], answer: "Providence as their guide"),
        Question(text: "In Books XI-XII, Michael shows Adam:", options: ["Hell's torments", "Heaven's glories", " Future human history", "The other planets"], answer: " Future human history"),
        Question(text: "'Paradise Regained'is about:", options: ["The Resurrection", "Christ's temptation in the wilderness", "The Second Coming", "Heaven restored"], answer: "Christ's temptation in the wilderness"),
        Question(text: "'Paradise Regained' has how many books?", options: ["2", "4", "10", "12"], answer: "4"),
        Question(text: "'Samson Agonistes' is written in the form of:", options: ["Epic poetry", "Greek tragedy", "Sonnet sequence", "Pastoral"], answer: "Greek tragedy"),
        Question(text: "'Agonistes' means:", options: ["Sufferer", " Blind man", " Contestant/athlete", "Prisoner"], answer: " Contestant/athlete"),
        Question(text: "Milton's companion poems are 'L'Allegro' and:", options: ["Il Penseroso", "Lycidas", " Comus", "Arcades"], answer: "Il Penseroso"),
        Question(text: "The English Civil War began in:", options: ["1625", "1642", "1649", "1660"], answer: "1642"),
        Question(text: "The period of republican rule (1649-1660) is called:", options: [" The Protectorate", "The Interregnum", "Romantic Period", "Victorian Era"], answer: "The Interregnum"),
        Question(text: "Oliver Cromwell held the title:", options: ["King", "Lord Protector", " Prime Minister", "President"], answer: "Lord Protector"),
        Question(text: "The monarchy was restored in:", options: ["1649", "1653", "1660", "1688"], answer: "1660"),
        Question(text: "Charles II was restored to the throne in 1660, beginning:", options: ["The Civil War", "The Restoration", "The Glorious Revolution", "The Tudor Era"], answer: "The Restoration"),
        Question(text: "The Great Fire of London occurred in:", options: ["1660", "1665", "1666", "1670"], answer: "1666"),
        Question(text: "The Great Plague of London occurred in:", options: ["1660", "1665", "1666", "1670"], answer: "1665"),
        Question(text: "The Glorious Revolution occurred in:", options: ["1660", "1678", "1688", "1707"], answer: "1688"),
        Question(text: "James II was deposed and replaced by:", options: ["Charles III", "William and Mary", " Anne", "George I"], answer: "William and Mary"),
        Question(text: "The Glorious Revolution was 'glorious' because:", options: ["It was very violent", "It was bloodless", "It expanded the empire", "It defeated France"], answer: "It was bloodless"),
        Question(text: "The Bill of Rights was enacted in:", options: ["1660", "1679", "1689", "1707"], answer: "1689"),
        Question(text: "England and Scotland united in:", options: ["1660", "1688", "1707", "1714"], answer: "1707"),
        Question(text: "The Act of Union created:", options: ["The British Empire", "Great Britain", "The United Kingdom", "The Commonwealth"], answer: "Great Britain"),
        Question(text: "The Hanoverian dynasty began with:", options: ["William III", "Anne", "George I", "George III"], answer: "George I"),
        Question(text: "George I became king in:", options: ["1707", "1714", "1727", "1760"], answer: "1714"),
        Question(text: "The Jacobite Rebellion of 1745 attempted to restore:", options: ["Charles II", "James II's line (the Stuarts)", "Oliver Cromwell", "Mary Queen of Scots"], answer: "James II's line (the Stuarts)"),
        Question(text: "'Bonnie Prince Charlie' was:", options: ["Charles I", "Charles Edward Stuart", "George II", "William of Orange"], answer: "Charles Edward Stuart"),
        Question(text: "The Seven Years' War lasted from:", options: ["1739-1746", "1756-1763", "1760-1767", "1775-1782"], answer: "1756-1763"),
        Question(text: "Britain gained control of Canada from France in:", options: ["1707", "1745", "1763", "1783"], answer: "1763"),
        Question(text: "The American Revolution began in:", options: ["1763", "1770", "1775", "1783"], answer: "1775"),
        Question(text: "Britain recognized American independence in:", options: ["1776", "1781", "1783", "1789"], answer: "1783"),
        Question(text: "The 'South Sea Bubble' financial crisis occurred in:", options: ["1707", "1720", "1745", "1756"], answer: "1720"),
        Question(text: "Robert Walpole is considered Britain's first:", options: ["King", "Prime Minister", "Lord Protector", "President"], answer: "Prime Minister"),
        Question(text: "The Enlightenment in 18th century Britain emphasized:", options: ["Religious authority", "Reason and scientific inquiry", "Absolute monarchy", "Medieval traditions"], answer: "Reason and scientific inquiry"),
        Question(text: "The Industrial Revolution began in Britain in the:", options: ["Early 17th century", " Mid-17th century", "Late 18th century", "Early 19th century"], answer: "Late 18th century"),
        Question(text: "The Test Acts discriminated against:", options: ["Catholics and Dissenters", "Women", "The poor", "Foreigners"], answer: "Catholics and Dissenters"),
        Question(text: "The Hanoverian kings were criticized for:", options: ["Being too involved in politics", " Not speaking English well", "Religious intolerance", "Warmongering"], answer: "Not speaking English well"),
        Question(text: "John Dryden was appointed the first official:", options: ["Prime Minister", "Poet Laureate", "Master of the Revels", "Royal Historian"], answer: "Poet Laureate"),
        Question(text: "Dryden's 'Absalom and Achitophel' is:", options: ["A biblical epic", "A political satire", "A love tragedy", "A pastoral poem"], answer: "A political satire"),
        Question(text: "'Absalom and Achitophel' allegorizes which political crisis?", options: ["The English Civil War", "The Glorious Revolution", "The Exclusion Crisis", "The Restoration"], answer: "The Exclusion Crisis"),
        Question(text: "In 'Absalom and Achitophel,' King David represents:", options: ["Oliver Cromwell", "Charles II", "James II", "William III"], answer: "Charles II"),
        Question(text: "Dryden's 'Mac Flecknoe' satirizes:", options: ["Politicians", "Bad poets", "The church", "The aristocracy"], answer: "Bad poets"),
        Question(text: "What literary period is Dryden associated with?", options: ["Renaissance", "Restoration", "Romantic", "Victorian"], answer: "Restoration"),
        Question(text: "Dryden converted to which religion?", options: ["Puritanism", "Anglicanism from Catholicism", "Roman Catholicism", "Presbyterianism"], answer: "Roman Catholicism"),
        Question(text: "'The Hind and the Panther' is:", options: ["A beast fable about religion", "A hunting poem", "A nature meditation", "A political allegory about animals"], answer: "A beast fable about religion"),
        Question(text: "Dryden's 'All for Love' is based on:", options: ["English history", "Shakespeare's Antony and Cleopatra", "Greek mythology", "Biblical stories"], answer: "Shakespeare's Antony and Cleopatra"),
        Question(text: "Dryden's critical essay 'An Essay of Dramatic Poesy' discusses:", options: ["Political theory", "Religious doctrine", "Literary theory and drama", "Scientific method"], answer: "Literary theory and drama"),
        Question(text: "Dryden wrote primarily in:", options: ["Blank verse", "Heroic couplets", "Free verse", "Terza rima"], answer: "Heroic couplets"),
        Question(text: "Dryden lost his position as Poet Laureate because:", options: ["He was too old", "He refused to convert religions", " He refused to denounce Catholicism after 1688", "He criticized the king"], answer: "He refused to denounce Catholicism after 1688"),
        Question(text: "Aphra Behn is significant as:", options: ["The first English queen", "One of the first professional female writers in English", "The first female poet laureate", "The first female publisher"], answer: "One of the first professional female writers in English"),
        Question(text: "Behn's most famous novel is:", options: ["Pamela", " Moll Flanders", "Oroonoko", "Roxana"], answer: "Oroonoko"),
        Question(text: "The Hanoverian kings were criticized for:", options: ["Being too involved in politics", " Not speaking English well", "Religious intolerance", "Warmongering"], answer: "Not speaking English well"),
        Question(text: "'Oroonoko' is about:", options: ["English court life", "An enslaved African prince", "A female pirate", "Religious persecution"], answer: "An enslaved African prince"),
        Question(text: "'Oroonoko' is set primarily in:", options: ["Africa", "England", "Surinam (South America)", "India"], answer: "Surinam (South America)"),
        Question(text: "Behn worked as a:", options: ["Governess", "Spy for Charles II", "Court musician", "Teacher"], answer: "Spy for Charles II"),
        Question(text: "Behn's most successful play was:", options: ["The Rover", "The Country Wife", "The Way of the World", "She Stoops to Conquer"], answer: "The Rover"),
        Question(text: "'The Rover' is a:", options: ["Tragedy", "History play", "Restoration comedy", "Morality play"], answer: "Restoration comedy"),
        Question(text: "Behn's poetry often addressed themes of:", options: ["Religion and piety", "Love and female desire", "War and heroism", "Nature and solitude"], answer: "Love and female desire"),
        Question(text: "Virginia Woolf said all women writers should lay flowers on Behn's tomb because:", options: ["She was the most talented", "She earned her living by writing", "She was the first female writer", "She fought for women's rights"], answer: "She earned her living by writing"),
        Question(text: "'Gulliver's Travels' was published in:", options: ["1706", "1726", "1736", "1746"], answer: "1726"),
        Question(text: "In 'Gulliver's Travels,' the Lilliputians are:", options: ["Giants", "Tiny people", "Flying creatures", "Immortals"], answer: "Tiny people"),
        Question(text: "In Lilliput, political parties are divided by:", options: ["Religion and economics", "High heels vs. low heels", "Geography", "Language"], answer: "High heels vs. low heels"),
        Question(text: "In 'Gulliver's Travels,'the Brobdingnagians are:", options: ["Tiny people", "Giants", "Horses", "Immortals"], answer: "Giants"),
        Question(text: "In 'Gulliver's Travels,'the flying island is called:", options: ["Laputa", "Lilliput", "Brobdingnag", "Houyhnhnm"], answer: "Laputa"),
        Question(text: "In 'Gulliver's Travels,'the Laputans are obsessed with:", options: ["War and conquest", "Mathematics and music", "Agriculture", "Literature"], answer: "Mathematics and music"),
        Question(text: "In 'Gulliver's Travels,'the Houyhnhnms are:", options: ["Savage humans", "Rational horses", "Giant birds", "ntelligent dolphins"], answer: "Rational horses"),
        Question(text: "In 'Gulliver's Travels,'the Yahoos represent:", options: ["Ideal humans", "Degraded humanity", "Animals", "Demons   "], answer: "Degraded humanity"),
        Question(text: "'Gulliver's Travels' is primarily a:", options: ["Travel adventure", "Children's fantasy", "Political and social satire", "Romance novel"], answer: "Political and social satire"),
        Question(text: "Swift satirizes which real war in the Lilliput section?", options: ["The Thirty Years' War", "Wars between England and France", "The American Revolution", "The Seven Years' War"], answer: "Wars between England and France"),
        Question(text: "In 'Gulliver's Travels,'the Big-Endian vs. Little-Endian conflict satirizes:", options: ["Political parties", "Religious disputes", "Class warfare", "Colonial conflicts"], answer: "Religious disputes"),
        Question(text: "In Book III of 'Gulliver's Travels,'the Academy of Lagado mocks:", options: ["Universities", "The Royal Society and scientific experiments", "Religious institutions", "The legal system"], answer: "The Royal Society and scientific experiments"),
        Question(text: "How many voyages does Gulliver make?", options: ["Two", "Three", "Four", "Five"], answer: "Four"),
        Question(text: "After visiting the Houyhnhnms, Gulliver:", options: ["Returns happily to England", "Becomes misanthropic", "Writes a philosophy book", "Warmongering"], answer: "Becomes misanthropic"),
        Question(text: "Swift's purpose in 'Gulliver's Travels' was to:", options: ["Entertain children", "Document real travels", "Satirize human folly and institutions", "Promote scientific discovery"], answer: "Satirize human folly and institutions")
    ]
                        
    var body: some View {
        if select.isEmpty {
            Text("Loading...")
                .font(Font.largeTitle.bold())
                .onAppear{
                    select = Array(LiteratureQuestion.shuffled().prefix(10))
                }
        }else{
            if gameover {
                VStack{
                    ZStack{
                        Image("greatchain")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                            .opacity(0.4)
                        VStack{
                            Image("book")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 100)
                                
                            ZStack{
                                RoundedRectangle(cornerRadius: 26, style: .continuous)
                                    .fill(Color.red)
                                    .frame(width: 300, height: 100)
                                    .opacity(0.8)
                                Text("Game Over !")
                                    .font(Font.largeTitle.bold())
                                    
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 26, style: .continuous)
                                    .fill(Color.white)
                                    .frame(width: 300, height: 100)
                                    .opacity(0.8)
                                Text("Total : \(score)")
                                    .font(Font.largeTitle.bold())
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 26, style: .continuous)
                                    .fill(Color.yellow)
                                    .shadow(color:.yellow, radius: 10)
                                    .frame(width: 300, height: 75)

                                Group {
                                    if score >= 100 {
                                        Text("✯ Tier: Master of Literature ✯")
                                    } else if score >= 80 {
                                        Text("✯ Tier: Distinguished Scholar ✯")
                                    } else if score >= 60 {
                                        Text("✯ Tier: Accomplished Reader ✯")
                                    } else {
                                        Text("✯ Tier: Beginning Explorer ✯")
                                    }
                                }
                                .bold()
                                .font(.title2)
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                                .padding(.horizontal, 12)
                                .frame(width: 300 - 16, height: 75, alignment: .center)
                            }

                            Button("Restart"){
                                score = 0
                                total = 0
                                gameover = false
                                select = Array(LiteratureQuestion.shuffled().prefix(10))
                            }
                            
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(Color.white)
                            .cornerRadius(30)
                        }
                    }
                }
            }
            else{
                ZStack{
                    Image("background1")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.7)
                        .containerRelativeFrame(.horizontal)
                        .ignoresSafeArea()
                        
                   
                    VStack {
                        // Score 區塊靠上
                        ZStack{
                            Capsule()
                                .fill(Color.white)
                                .frame(width: 220, height: 100)
                                .opacity(0.8)
                            Text("Score : \(score)")
                                .font(Font.largeTitle.bold())
                        }
                        .padding(.top, 24)
                        
                        Spacer(minLength: 12)
                        
                        // 題目區塊：固定高度 + 可捲動，確保能完整閱讀
                        VStack(spacing: 8) {
                            Text("Q.\(total+1)")
                                .font(Font.largeTitle.bold())

                            ScrollView {
                                Text(select[total].text)
                                    .font(.system(size: 28))
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(.horizontal, 24)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .allowsTightening(true)
                            }
                            .frame(maxWidth: .infinity, minHeight: 160, maxHeight: 260)
                            .padding(.horizontal, 8)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 12)
                        .layoutPriority(1)
                        
                        Spacer(minLength: 8)

                        // 放大選項按鈕 + 增加間距
                        VStack(spacing: 16) {
                            ForEach(select[total].options, id: \.self) { option in
                                Button(action: {
                                    if option == select[total].answer{
                                        score += 10
                                    }
                                    if total < select.count - 1{
                                        total += 1
                                    }else{
                                        gameover = true
                                    }
                                }) {
                                    Text(option)
                                        .font(.title3.bold())
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 280, height: 80) // 調整按鈕尺寸
                                        .contentShape(Rectangle())
                                }
                                .padding(.vertical, 2) // 額外的觸控緩衝
                                .background(Color(red: 183/255, green: 224/255, blue: 237/255, opacity: 0.95))
                                .cornerRadius(22)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 22)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                            }
                        }
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
