import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import * as express from 'express';
import * as bodyParser from "body-parser";

admin.initializeApp(functions.config().firebase);

const app = express();
const main = express();

main.use('/api/v1', app);
main.use(bodyParser.json());

export const webApi = functions.https.onRequest(main);

app.get('/chautinhtri', (request, response) => {

    // response.send('Warming up friend.');
    response.json(
                    [
                        {
                            name: 'CHÂU TINH TRÌ',
                            image: "dd",
                            filmList:
                            [
                                {
                                    title: 'Đặc Cảnh Uy Long 1 (Bản Đẹp)',
                                    content: `Đặc Cảnh Uy Long 1 là bộ phim hài Hồng Kông của đạo diễn Gordon Chan và Châu Tinh Trì được sản xuất vào năm 1991. Tiếp sau sự thành công của bộ phim này đã tạo tiền đề cho sự thành công của phần các phần tiếp theo là Đặc Cảnh Uy Long II và Đặc Cảnh Uy Long III. Trong bộ phim này Châu Tinh Trì vào vai cảnh sát chìm Chow Sing-Sing, thâm nhập vào một trường trung học với mục tiêu là tìm cho ra cây súng của sếp mình bị đánh cắp. Cùng với sự trợ giúp của các đồng nghiệp cảnh sát cũng giả dạng thành học sinh, công cuộc tìm kiếm của Chow cũng vẫn gặp đầy khó khăn bởi sự lì lợm của những đứa học trò, sự khó chịu của các thầy cô giáo, và hơn nữa là Chow lại đụng độ với tên đầu gấu của trường. Nhưng đối với Chow, để bù lại những khó khăn thử thách đó thì chỉ cần được gặp mặt cô giáo mới chuyển công tác đến trường là đủ.`,
                                    videoKey: 'VAZT8Mia8f4'
                                },
            
                                {
                                    title: 'Đặc Cảnh Uy Long 2 (Bản Đẹp)',
                                    content: `Đặc Cảnh Uy Long là bộ phim hài Hồng Kông của đạo diễn Gordon Chan và Châu Tinh Trì được sản xuất vào năm 1991. Tiếp sau sự thành công của bộ phim này đã tạo tiền đề cho sự thành công của phần các phần tiếp theo là Đặc Cảnh Uy Long II và Đặc Cảnh Uy Long III. Trong bộ phim này Châu Tinh Trì vào vai cảnh sát chìm Chow Sing-Sing, thâm nhập vào một trường trung học với mục tiêu là tìm cho ra cây súng của sếp mình bị đánh cắp. Cùng với sự trợ giúp của các đồng nghiệp cảnh sát cũng giả dạng thành học sinh, công cuộc tìm kiếm của Chow cũng vẫn gặp đầy khó khăn bởi sự lì lợm của những đứa học trò, sự khó chịu của các thầy cô giáo, và hơn nữa là Chow lại đụng độ với tên đầu gấu của trường. Nhưng đối với Chow, để bù lại những khó khăn thử thách đó thì chỉ cần được gặp mặt cô giáo mới chuyển công tác đến trường là đủ. `,
                                    videoKey: '0G3OtyPjumU'
                                },
            
                                {
                                    title: 'Đặc Cảnh Uy Long 3 (Bản Đẹp)',
                                    content: `Đặc Cảnh Uy Long là bộ phim hài Hồng Kông của đạo diễn Gordon Chan và Châu Tinh Trì được sản xuất vào năm 1991. Tiếp sau sự thành công của bộ phim này đã tạo tiền đề cho sự thành công của phần các phần tiếp theo là Đặc Cảnh Uy Long II và Đặc Cảnh Uy Long III. Trong bộ phim này Châu Tinh Trì vào vai cảnh sát chìm Chow Sing-Sing, thâm nhập vào một trường trung học với mục tiêu là tìm cho ra cây súng của sếp mình bị đánh cắp. Cùng với sự trợ giúp của các đồng nghiệp cảnh sát cũng giả dạng thành học sinh, công cuộc tìm kiếm của Chow cũng vẫn gặp đầy khó khăn bởi sự lì lợm của những đứa học trò, sự khó chịu của các thầy cô giáo, và hơn nữa là Chow lại đụng độ với tên đầu gấu của trường. Nhưng đối với Chow, để bù lại những khó khăn thử thách đó thì chỉ cần được gặp mặt cô giáo mới chuyển công tác đến trường là đủ.`,
                                    videoKey: 'X3WBYZjPPUQ'
                                },
            
                                {
                                    title: 'La Hán Thần Công (Tế Điên)',
                                    content: `La Hán Thần Công (Tế Điên) là một bộ phim được sản xuất vào năm 1993 Hồng Kông, phim hài của đạo diễn Johnny To với diễn viên chính là Châu Tinh Trì. Đây được đánh giá là bộ phim hài nổi tiếng của Châu Tinh Trì. Trong đó, Châu Tinh Trì đóng vai Tế Công, vì muốn chứng minh “Nhân gian hữu tình” với các chư tiên nên đã xuống trần làm người phàm . Nhiệm vụ của Tế Công dưới dương gian là phải cảm hóa 3 người : 1 người chín kiếp làm ăn mày, 1 người chín kiếp làm ác nhân, 1 người chín kiếp làm kỷ nữ để cho họ thay đổi bản chất mà số phận sắp đặt cho họ, nhưng anh không được dùng pháp lực… Những tình huống dở khóc dở cười đã diễn ra.`,
                                    videoKey: 'AIQ4LnxiE9Q'
                                },
            
                                {
                                    title: 'Ma Đăng Tiểu Giới',
                                    content: `Ma Đăng Tiểu Giới là một trong những bộ phim hài đặc sắc của điện ảnh Hồng Kông những năm thập niên 90. Trong phim các nhân vật được xây dựng một cách muốn hút đầy tinh tế nhưng không kém phần hài hước, với sự tham gia của những diễn viên nổi tiếng hàng đầu như: Châu Tinh Trì, Trương Vệ Kiện, Ngô Mạnh Đạt, Lê Thụy Ân, Lâm Kiến Minh.... Đây là một trong những bộ phim tham gia thời kì đầu đóng phim của Châu Tinh Trì, với lối diễn xuất tài tình vô cùng hài hước của mình Châu Tinh Trì đã góp phần đem lại một bộ phim hài hước đầy ý nghĩa. `,
                                    videoKey: 'e7ax1KgPEiI'
                                },
            
                                {
                                    title: 'Vua Hài Kịch',
                                    content: `Vua hài kịch (phồn thể: 喜劇之王, Hán Việt: Hỉ kịch chi vương, tiếng Anh: King of Comedy) là một bộ phim Hồng Kông do Châu Tinh Trì và Lý Lực Trì làm đạo diễn và được công chiếu lần đầu năm 1999. Đây là một phim tình cảm hài với dàn diễn viên chính gồm Chu Tinh Trì, Mạc Văn Úy, Trương Bá Chi và Ngô Mẫn Đạt. Nhờ thành công của bộ phim này, Trương Bá Chi đã trở thành một ngôi sao mới của điện ảnh Hồng Kông. Doãn Thiên Cừu (Châu Tinh Trì) là một diễn viên ham mê điện ảnh nhưng có sự nghiệp trắc trở, anh phải sống bằng nghề trông coi một nhà văn hóa và xin vào đóng những vai quần chúng cho các bộ phim của ngôi sao Đỗ Quyên Nhi (Mạc Văn Úy). Trong một lần được nhờ dạy diễn xuất cho nhóm vũ nữ, anh làm quen với Liễu Phiêu Phiêu (Trương Bá Chi), một vũ nữ trẻ tuổi có tính cách mạnh mẽ. Hai người nhanh chóng phải lòng nhau và Doãn Thiên Cừu đề nghị Liễu Phiêu Phiêu thôi nghề vũ nữ để anh nuôi cô. Mặc dù gây ra nhiều rắc rối ở trường quay, Doãn Thiên Cừu đã được Đỗ Quyên Nhi chú ý vì sự ham mê điện ảnh của anh, cô quyết định mời Doãn tham gia bộ phim mới của cô trong vai nam chính. Tuy nhiên sau đó Doãn Thiên Cừu đã bị tước vai này để giao lại cho một ngôi sao điện ảnh khác. Anh được chú Đạt (Ngô Mạnh Đạt) mời giúp cảnh sát trong vai một người đưa thức ăn để lén gắn máy nghe trộm vào hang ổ của bọn cướp.`,
                                    videoKey: 'Co44B04dm30'
                                },
            
                                {
                                    title: 'Vỏ Quýt Dày Móng Tay Nhọn',
                                    content: `Nội dung bộ phim : Dựa theo câu chuyện Starsky & Hutch, bộ film nói về cặp đôi cảnh sát hậu đậu đang thực hiện nhiệm vụ được giao với những tình tiết hài hước bởi sự may mắn một cách kỳ lạ của họ.`,
                                    videoKey: 'rWOaMvT4zjc'
                                },
            
                                {
                                    title: 'Nghĩa Khí Quần Anh (Đại Ca Giang Hồ)',
                                    content: `Bộ phim: Nghĩa Khí Quần Anh (Đại Ca Giang Hồ) Là một trong những tên tuổi có tiếng trong giới phim Hồng Kông thập niên 80, 90 Ngô Vũ Sâm được đánh giá là một trong những đạo diễn đầy tài năng trong thể loại phim hành động Hồng Kông. Các tác phẩm điện ảnh của ông nổi tiếng cả trong và ngoài nước. Bộ phim Nghĩa Khí Quần Anh (Nghĩa Đảm Quần Anh) là sự kết hợp của ông với đạo diễn Mã Ngọ. Với sự kết hợp tài ba của hai nhà đạo diễn danh tiếng đã khắc họa lên một bộ phim điên ảnh vô cùng thú vị với những tình tiết hành động kịch tính cũng không kém phần vui nhộn. Tham gia bộ phim cũng có rất nhiều tên tuổi nổi tiếng bấy giờ như: Lý Tu Hiền, Khương Đại vệ, Địch Long và không thế không nhắc tới diễn viên chính của bộ phim Vua Hài Châu Tinh Trì. Châu Tinh Trì với lối diễn xuất tài năng của mình đã xây dựng lên một nhân vật rất thành công trong bộ phim. Nghĩa Khí Quần Anh là bộ phim hành động võ thuật Hồng Kông được sản xuất năm 1989. Bộ phim bắt đầu sau cái chết của thủ lĩnh một tổ chức tội phạm lớn ở Hồng Kông, tất cả những nhà lãnh đạo khác của tổ chức đều nhăm nhe tranh giành quyền lực tối thượng đó. Pak Wai là người tìm cách đưa kẻ phản bội tổ chức ra ngoài ành sáng nhưng không tìm ra được bằng chứng cụ thể, trong khi Sou, thủ lĩnh được bầu tạm thời đã liên tiếp bị tấn công bất ngờ khi anh ta cố gắng đưa tổ chức trở lại hoạt động dưới sự kiểm soát của mình. Hành động của họ bị ngăn cản bởi Jacky, người đang cố gây ra mâu thuẫn trong nội bộ tổ chức. Đỉnh điểm của mâu thuẫn được đẩy lên khi kẻ phản bội lộ mặt và quyết tâm giành quyền kiểm soát tổ chức. `,
                                    videoKey: 'BGZUfDUWHTk'
                                },
            
                                {
                                    title: 'Trà Lầu Long Phụng',
                                    content: `Bộ phim thuộc dòng phim hành động xã hội đen của đạo diễn Poon Man-Kit với sự tham gia của các diễn viên nổi tiếng hàng đầu Châu Tinh Trì, Ngô Mạnh Đạt, Max Mok… Châu Tinh Trì trong vai là một tên lưu manh chuyên thích đánh nhau, nội dung bộ phim xoay quanh câu chuyện nói về cuộc sống của xã hội đen Hồng Kông những năm 90, bối cảnh là những băng đảng trong giang hồ, trong đó nói về nhân vật Long (Max Mok) và người bạn thân, hai người là bạn giang hồ chí cốt, tình thân như hai anh em.Sau khi người chú của người kia bị sát hại, Long dự định sẽ làm lại tất cả, xây dựng cuộc đời nhưng vì chuyện này mà mới sau khi mãn hạn tù,anh ta cùng người anh em kia cùng nhau trả thù cho người đã mất...Trong phim diễn ra nhiều tình tiết diễn biến tâm lý nhân vật sâu sắc, lấy đy nhiều nước mắt của người xem với những tình nghĩa đẹp trong giang hồ, nổi bật lên là cuộc tình của chàng trai Long và cô gái giang hồ bên cạnh những cuộc chiến giang hồ khốc liệt...`,
                                    videoKey: 'vnZ5bBVQv_g'
                                },
            
                                {
                                    title: 'Giang Hồ Huyết Lệ',
                                    content: `Trước khi trở thành vua hài của Châu Á Châu Tinh Trì đã phải thể hiện mình qua rất nhiều bộ phim từ truyền hình cho đến điện ảnh, trong đó vai diễn trong bộ phim hành động Giang Hồ Huyết Lệ chính là một trong những tác phẩm đưa tên tuổi ông đến gần với khán giả, bộ phim ra mắt vào năm 1990 của đạo diễn Parkaman Wong, ở thời điểm đó bộ phim cũng được đánh giá là một trong những bộ phim hay về diễn xuất và cả về mặt nghệ thuật. Nội dung của phim xoay quanh một cảnh sát chìm tên là Cheung ( Châu Tinh Trì) người phải kết bạn với một cựu thành viên của Hội Tam Hoàng có tên là Fei (Chan Wai-Man) để điều tra về một án trộm kim cương hết sức táo bạo trong thời gian gần đây, Sau một thời gian nằm vùng phát hiện Fei không có liên quan gì đến vụ án nhưng anh ta lại chính là mấu chốt để tìm ra manh mối rất quan trọng liên quan đến vụ án. Trong quá trình điều tra Cheung và Fei đã trở thành anh em, một cuộc chiến đấu khốc liệt đã diễn ra, các tình tiết trong phim vô cùng gay cấn giữa những cuộc truy sát và đấu súng giữa 2 bên, kẻ xấu đã dùng bạn gái của Cheung một gái xinh đẹp với hành động đe dọa, liệu câu chuyện sẽ diễn tiếp thế nào ?`,
                                    videoKey: 'YMiGevzCMV8'
                                },
            
                                {
                                    title: 'Trạng Sư Xảo Quyệt (Vua Cãi Quảng Đông)',
                                    content: `Trạng Sư Xảo Quyệt là bộ phim hài xoay quanh một nhân vật nổi tiếng Trung Quốc, đó là Trạng sư Trần Mộc Cách, người được mệnh danh là 'vua cãi Quảng Đông', cùng học trò Phan giết thời gian bằng thú 'đâm bị thóc chọc bị gạo'. Nạn nhân của Mộc Cách còn có chính anh học trò khù khờ Phan. Khi Phan đem lòng yêu mến cô nghệ nhân rối Liên, anh bị sư phụ lừa đến Hồng Kông, chạy theo tiếng gọi của tình yêu. Nào ngờ, Phan dính vào một vụ án mạng. Mộc Cách cùng vợ phải đến Hồng Kông để bảo vệ cho học trò. Chỉ có điều, luật pháp xứ này theo lệ phương Tây, do người Anh quản lý. Liệu miệng lưỡi giảo hoạt của Mộc Cách có giúp anh cứu học trò?`,
                                    videoKey: '4_2p6hlx_r4'
                                },
            
                                {
                                    title: 'Anh Hùng Của Tôi',
                                    content: `Anh Hùng Của Tôi ( My Hero): Nhân vật Sing rất thích đọc truyện tranh và thường mơ mộng trở thành một ông trùm và nổi tiếng. Bởi tai nạn, ông trở thành một tín đồ của Wai, một nhà lãnh đạo băng nhóm, và làm cho một người bạn của con trai nuôi của Wai, Chun. Các loạt những thành công của Sing và khinh miệt giống Chun Wai trong trái tim của. Wai có kế hoạch để loại bỏ chúng để mở đường cho con trai mình để thành công cho doanh nghiệp của riêng mình. Tuy nhiên, con trai của mình giết chết anh ta ..`,
                                    videoKey: '7Ci-BFxy43Y'
                                },
            
                                {
                                    title: 'Bịp Vương 2000 (Chúa Bịp Thượng Hải)',
                                    content: `Bịp Vương 2000 (The Tricky Master 1999) được sản xuất vào nắm 1999 được đánh giá là một tác phẩm nghệ thuật đỉnh cao của đạo diễn Vương Tinh với sự tham gia diễn xuất của các diễn viên: Châu Tinh Trì, Trương Gia Huy, Ngô Quân Như, Lâm Hy Lôi, Vương Tinh, Nick Cheung, Sandra Ng, Suki Kwan, Kelly Lin, Wong Jing, Bịp Vương 2000 là bộ phim hài của Châu Tinh Trì xoay quanh anh chàng cảnh sát chìm Lương Khoan, do sai sót trong hành động đã bị khiển trách nặng nề. Được giao cơ hội khám phá chứng cứ tội phạm... The Tricky Master (Bịp Vương Thượng Hải) là bộ phim hài của Châu Tinh Trì xoay quanh anh chàng cảnh sát chìm Lương Khoan, do sai sót trong hành động đã bị khiển trách nặng nề. Được giao cơ hội khám phá chứng cứ tội phạm của tay cờ bạc khét tiếng Ferrari, Lương Khoan nhanh nhảu lên đường làm nhiệm vụ. Tuy nhiên, do chưa có kinh nghiệm phá án liên quan đến các tổ chức cờ bạc phi pháp, phải tự tầm sư học đạo để dễ dàng xâm nhập vào giới bài bạc. Bạn gái của Khoan giới thiệu cho anh người họ hàng xa là Hoàng Phi Hổ, vua bịp bạc Hồng Kông vừa được ra tù giúp đỡ...`,
                                    videoKey: 'OXsf0hlGgCw'
                                },
            
                                {
                                    title: 'Chuyên Gia Xảo Quyệt',
                                    content: `Chuyên Gia Xảo Quyệt (Vua hài) Châu Tinh Trì vào vai tên lừa đảo Koo chuyên nghiệp. Được Waise Lee thuê để tìm cách trả thù Lưu Đức Hòa trong công việc. Koo nhận nhiệm vụ và giả dạng thành em trai lưu lạc của Lưu Đức Hòa. Từ đó Ko phải tiếp xúc và va chạm với gia đình của Lưu để hoàn thành công việc đã giao. Liệu Koo có tiếp tục công việc mà Lee đã giao phó là hạ gục Lưu hay Koo sẽ bị cảm hóa bởi gia đình của Lưu.`,
                                    videoKey: 'QlN3lJOh0JE'
                                },
            
                                {
                                    title: 'Thần Ăn (Thần Thực)',
                                    content: `Bộ Phim Thần Ăn (1996): Thần ăn (Trung văn giản thể: 食神; Trung văn phồn thể: 食神; bính âm: Shi Shen; Yale Quảng Đông: Sik San, tiếng Anh: The God of Cookery) là một bộ phim Hồng Kông do Chu Tinh Trì và Lý Lực Trì đạo diễn, tác phẩm được công chiếu lần đầu năm 1996. Là một phim hài về ẩm thực, bộ phim nói về những cuộc thi nấu ăn ở Hồng Kông để tranh vị trí "thần ăn". Dàn diễn viên chính của phim gồm có Chu Tinh Trì, Mạc Văn Úy, Cốc Đức Chiêu và Ngô Mạnh Đạt. Thần ăn cùng Thẩm tử quan là hai bộ phim mà vai diễn của Chu Tinh Trì và Ngô Mạnh Đạt ở hai tuyến nhân vật đối lập. Bộ phim sau khi công chiếu đã được đánh giá là thành công cả về doanh thu và nghệ thuật Trong phim Châu Tinh Trì này, anh là một đầu bếp được Hiệp hội đầu bếp Pháp trao tặng danh hiệu “Thực thần” (Vua đầu bếp) nên tính tình kiêu ngạo, là người giữ vị trí số một trong làng chế biến ẩm thực ở hòn đảo này. Tuy nhiên Chu không giữ vị trí này được lâu khi bị chủ tịch tập đoàn cùng Đường Ngưu âm mưu lật đổ để Đường Ngưu trở thành thần ăn mới. Kết cuộc, anh bị chính người thân cận nhất của mình bán đứng trong một cuộc thi nấu ăn, khiến nhà vua phải lưu lạc đầu đường xó chợ. Nhờ sự giúp đỡ của chị Gà tây, một người bán mì ngoài chợ trời và là người hâm mộ thần ăn, Chu dần lấy lại được vị thế ở Hồng Kông và đứng ra thách đấu với Đường Ngưu để giành lại vị trí cũ. Để luyện tay nghề, Chu quyết định tới chùa Thiếu Lâm để luyện công phu làm bếp. `,
                                    videoKey: 'alktqTfPflY'
                                },
            
                                {
                                    title: 'Điệp Viên 007 (Quốc Sản 007)',
                                    content: `Nội dung của phim: Một kẻ dùng súng vàng (Hoàng Cẩm Giang) ăn cắp hóa thạch sọ khủng long duy nhất của Trung Quốc. Một tư lệnh công an đã cử 007 (Châu Tinh Trì), một điệp viên bí mật kiêm bán dạo thịt lợn, đi tìm lại đầu khủng lâu bị mất với đầu mối đầu tiên là ở Hồng Kông. Vũ khí 007 thường sử dụng chính là con dao to bản chuyên dùng để chặt thịt lợn. Khi đến Hồng Kông 007 gặp Lý Hương Cầm (Viên Vịnh Nghi), người được cử đến giúp đỡ anh trong điệp vụ này. Tuy nhiên Hương Cầm thực tế lại là thuộc cấp của Súng Vàng, mà Súng Vàng lại chính viên tư lệnh công an đã giao nhiệm vụ cho 007. Súng Vàng ra lệnh cho Hương Cầm hướng 007 đến một đầu mối giả: rất có thể La Hữu Vi, một trùm buôn lậu ở Hồng Kông, đã lấy cấp sọ khủng long. Với sự trợ giúp của Hương Cầm, 007 đã lẻn vào buổi tiệc của La Hữu Vi. Trước khi vào 007 nói với Hương Cầm rằng anh sẽ lấy vài bông hồng trắng để tặng cô. Trong khi đó, Hương Cầm ẩn bên ngoài với ý định ám sát 007. Tuy nhiên nhưng cô bị gián đoạn khi 007 đã đàn piano và hát, bài hát mang tên mẹ cô - Lý Hương Lan. Sau đó hai sát thủ, một nam một nữ, xuất hiện và định giết 007, nhưng 007 thoát được. Lúc này Hương Cầm bắt đầu bắn 007 nhưng không trúng và để 007 chạy thoát ra ngoài cổng. Đột nhiên 007 chạy ngược lại phía bụi hoa bên trong, lúc này anh mới bị Hương Cầm bắn trúng nhiều phát đạn vào người và 1 phát vào đùi (anh không chết mà chỉ bị thương ở đùi vì được mặc áo chống đạn nhưng không mặc quần chống đạn). Sau khi thoát ra ngoài biệt thự, 007 lên xe cùng Hương cầm và tặng cô 3 bông hồng trắng - anh đã quay lại hái những bông hoa này nên mới bị trúng đạn của Hương Cầm. Hương Cầm bắt đầu phát sinh tình cảm với 007, cô đưa anh về nhà, mổ lấy đạn giúp anh và quyết định chống lại Súng Vàng. Cả hai cùng tiêu diệt Súng Vàng cùng tổ chức tội phạm của y. 007 được thưởng một con dao chặt thịt lợn mới, trên dao có khắc lời đề tặng của chủ tịch Trung Quốc Đặng Tiểu Bình: "Anh hùng dân tộc - Tiểu Bình tặng".`,
                                    videoKey: 'Opzw5_Ks2rY'
                                },
            
                                {
                                    title: 'Tân Tinh Võ Môn 1',
                                    content: `Tân Tinh Võ Môn: Bộ film được phỏng theo Tinh Võ Môn của Lý Tiểu Long, noí về sự đối đầu giữa người Trung Quốc và Nhật Bản. Trong trận đánh cuối cùng, Châu Tinh Trì sử dụng ngón võ thuật bí truyền của Tinh Võ Môn để chiến thắng.`,
                                    videoKey: 'f748ufoHBrc'
                                },
            
                                {
                                    title: 'Tân Tinh Võ Môn 2',
                                    content: `Tân Tinh Võ Môn 2 (Fist Of Fury2) là một bộ phim điện ảnh do Hồng Kông sản xuất vào năm 1992, bộ phim nối tiếp sau sự thành công của Tân Tinh Võ Môn,lúc này Tinh Tinh thắng trong cuộc đấu võ và được thưởng một số tiền, sau khi bị bốn vị sư phụ sử dụng hết tiền giải thắng được, Lưu Tinh lâm vào thế túng quẫn không tiền trả tiền nhà , bị người yêu (Chương Mẫn) hiểu là là người đồng tính... `,
                                    videoKey: 'VwqleH_qfJk'
                                },
            
                                {
                                    title: 'Thần bài 1',
                                    content: `Trong phim Thánh Bài 1: Châu Tinh Trì vào vai Sing, một anh chàng khù khờ nhưng có năng lực phi thường đến Trung Quốc thăm chú mình - Tat. Lúc đầu, anh chỉ là một cục nợ đối với Tat nhưng khi phát hiện ra Sing có thề nhìn thấu vật thể, Tat đã lợi dụng khả năng của Sing làm mưa làm gió chốn bài bạc. Trong cuộc đấu tay đôi giữa thần bài Gao Jin và tên sát thủ đã giết chết cha mình, Jin biết được Nan, người làm chủ ván bài đã chơi gian lận, tương kế tựu kế, Jin đã tìm cách thắng được ván bài đó và thu về một số tiền khổng lồ. Sau đó, Nan đã yêu cầu một nhóm sát thủ hòng thủ tiêu Jin. Jin thoát chết nhưng bị mất trí nhớ, được Dao và bạo gái cưu mang. Nhưng Nan vẫn tìm ra được nơi trú thân của Jin và vẫn gửi người đến ám sát Jin. Trong lúc đó, Jin dần dần phục hồi trí nhớ và cuộc đấu tay đôi sống còn giữa Jin và kẻ thù giết cha là một kết cục không thể nào tránh khỏi.`,
                                    videoKey: 'jf5bsfbUIKU'
                                },
            
                                {
                                    title: 'Thần bài 2',
                                    content: `Trong Phim Thần Bài 2: Đệ tử của Vua Bài (Lưu Đức Hòa đã trở lại, cùng với Syephen (Châu Tinh Trì), một người có khả năng đặc biệt. Phim với sự góp mặt của các diễn viên Châu Tinh Trì - Ngô Mẫn Đạt - Cheung Man, đạo diễn phim là Wong Jing. Phim được phát hành 1991. Phim Thần Bài 2 | God Of Gamblers Ii là phim mang yếu tố Hài Hước. Họ làm mưa làm gió trên các sòng bạc lớn ở Hong Kong, nhưng liệu họ có thể tiếp tục như vậy không?`,
                                    videoKey: 'nHs3ryHKi4g'
                                },
            
                                {
                                    title: 'Thần Bài 3',
                                    content: `Phần tiếp theo bộ phim Thần Bài 2 nhưng không có sự tham gia của Lưu Đức Hòa, lần này Châu Tinh Trì du hành ngược thời gian về những năm 30s ở Hong Kong Bộ phim này tập trung vào các đệ tử của Đức Chúa Trời của Gamblers, Chow Sing Cho, còn được gọi là 'Saint Gamblers'. Một nhóm những người có quyền hạn vô tình gửi anh ta đến năm 1937, tại Thượng Hải. Đây là một năm rất quan trọng trong lịch sử gia đình của Sing, và ông phải sử dụng quyền hạn của mình đóng một phần có tác dụng không thể thu hồi trên hiện tại và tương lai của mình, trong khi cố gắng để tìm thấy một cách trở về nhà, năm 1991...`,
                                    videoKey: 'yBMiZkd_-K4'
                                },
            
                                {
                                    title: 'Thánh Tinh (Tình Thánh)',
                                    content: `Thánh Tinh (Tình Thánh)`,
                                    videoKey: 'R2-4DcXTAIs'
                                },
            
                                {
                                    title: 'THÁNH BỊP RA TÙ',
                                    content: `THÁNH BỊP RA TÙ - Phim Hành Động Hài Bá Đạo CHÂU TINH TRÌ`,
                                    videoKey: 'NzziUDpDNsk'
                                },
            
                                {
                                    title: 'Chuyên Gia Bắt Ma',
                                    content: `Giới thiệu : Một Anh chàng chuyên bắt ma vì anh ta quá dũng cảm nên không sợ ma , nên người tar tưởng anh tar điên đưa vào nhà thương điên ... và nhiều tình huống dở khóc dở cười khác .. thôi nói, ít thôi , Các bạn xem kể hết coi hết vui ^_^`,
                                    videoKey: '_oxk-bkuaLk'
                                },
            
                                {
                                    title: 'Quan Xẩm Lốc Cốc',
                                    content: `Quan Xẩm Lốc Cốc - Châu Tinh Trì`,
                                    videoKey: 'bJpDd9SUdAk'
                                }
                                
                            ]
                        },
                        {
                            name: 'LÍ LIÊN KIỆT',
                            image: '',
                            filmList:
                            [
                                {
                                    title: 'Thần Kê Ngô Công',
                                    content: `Đây là một bộ phim của đạo diễn: Jing Wong,Woo-ping Yuen với dàn diễn viên nổi tiếng như: Lương Gia Nhân, Lý Liên Kiệt, Trương Mẫn, Trương Quốc Vinh, Trương Vệ Kiện, Viên Vịnh Nghi.. Trong đó Lý Liên Kiệt trong vaiHoàng Phi Hồng. Sau 2 phần phim Hoàng Phi Hồng rất thành công được ra mắt vào năm 1991 và 1992, bộ phim Thần Kê Đấu Ngô Công cũng có thể được gọi là phần tiếp theo không chính thức bởi trong phim Lý Liên Kiệt tiếp tục đảm nhiệm vai Hoàng Phi Hồng nhưng dàn diễn viên đã có sự thay đổi và nội dung phim thì không nối tiếp 2 phần trước. Tất nhiên vẫn có đó những màn đấu võ mãn nhãn , những cảnh hành động kịch tính và cốt truyện hấp dẫn. Nội dung phim: Trong xã hội phong kiến Trung Quốc đang thời kì rối ren, nổi lên các cuộc khởi nghĩa trong đó có "Nghĩa Hòa Đoàn". Trong khi Phương Tây đang nhòm ngó Trung quốc, coi Trung quốc là một nước béo bở. Không ngờ trong hàng ngũ quan lại mà nơi Hoàng Phi Hồng ở lại có người của "Nghĩa Hòa Đoàn". Phim có thời lượng đến 105 phút được công chiếu trước công chúng vào năm 1993. Chính vì vô tình biết đựoc âm mưu buôn bán con gái sang nước ngoài. Và âm mưu bắt cóc người Tây để thả đồng bọn. Vì chính nghĩa Phi Hồng sẽ làm thế nào để ngăn bọn chúng để Trung Quốc bớt loạn. The channel is set up for non-commercial purposes. The channel was founded by a community of movie lovers Jet Li and idols Jet Li. This is the place to store and share the legendary movies of Jet Li on youtube. The channel stores good quality vieo for the purpose of sharing non-profit as a gift to the community of fans and favorites Jet Li in Vietnam. Videos that are not uploaded please tell us, we will remove put down. Thank you.`,
                                    videoKey: 'jjESvk_X5-c'
                                },
                                {
                                    title: 'Long Môn Phi Giáp',
                                    content: `Long môn phi giáp là một phim kiếm hiệp 3D hợp tác sản xuất giữa điện ảnh Hồng Kông và Trung Quốc, bấm máy ngày 10 tháng 10 năm 2010, dự định công chiếu tháng 11 năm 2011, với sự có mặt của minh tinh màn bạc gạo cội Lý Liên Kiệt và người đẹp Châu Tấn. Kinh phí của bộ phim được tiết lộ lên tới 35 triệu đô la Mỹ, trong đó riêng Lý Liên Kiệt là 12 triệu. Nội dung phim: Vào thời trị vì của Minh Hiến Tông, hoạn quan lộng quyền lạm sát hiền thần. Hiệp khách Triệu Hoài An (Lý Liên Kiệt đóng) trong quá trình cứu giúp trung thần đã một gươm lấy mạng đốc chủ Đông xưởng tội ác tày trời là Vạn Dụ Lâu, khiến đốc chủ Tây Xưởng Vũ Hóa Điền (Trần Khôn đóng) hạ lệnh truy sát khắp thiên hạ. Nhóm của Triệu Hoài An trốn chạy tới Long Môn ở Gia Dụ Quan, mất hút trong bão cát đen mịt mùng đất trời. Sau khi sóng êm biển lặng, mật thám Tây xưởng, đội thương nhân Thát Đát chia ra khắp nẻo giang hồ, lại một lần nữa tới hắc điếm đại mạc khách điếm Long Môn. Trong khách điếm Long Môn đã bị thiêu trụi ba năm trước, bà chủ quán lẳng lơ cũng đã không thấy tăm tích một cách thần bí, chỉ còn lại những người làm may mắn thoát khỏi vụ hỏa thiêu, dựng lại quán xá, chờ đợi bà chủ quay lại. Khách điếm nơi biên ải gần như đã bị người đời lãng quên lại một lần nữa gió nổi mây vần. Dung mạo của kiếm khách thần bí Bộc Thương Chu không khác gì đốc chủ Tây xưởng Vũ Hóa Điền. Nữ tử thổi sáo Lăng Nhạn Thu (Châu Tấn đóng) thông thạo mật đạo của khách điếm như lòng bàn tay kia, lại là người nào? Đúng lúc truy binh Tây xưởng do Vũ Hóa Điền dẫn đầu tiến tới, mặt đất đột ngột nổi lên mấy trận gió lốc thần phong, Triệu Hoài An bay ra từ giữa không trung, hòng một trận sống mái với Vũ Hóa Điền. Giữa gió bụi đại mạc, một trận chiến giữa chính với tà khiến đất trời biến sắc bắt đầu.`,
                                    videoKey: 'RS1XwLh1X78'
                                },
                                {
                                    title: 'Phương Thế Ngọc 1',
                                    content: `Phương Thế Ngọc là một tiểu anh hùng trong huyền thoại Trung Hoa, là con trai Phương Đức, một thương gia giàu có, và Miêu Thúy Hoa. Phương Thế Ngọc từ nhỏ đã được rèn luyện võ công từ người mẹ Miêu Thúy Hoa, vốn là con gái của Miêu Hiển, một trong năm vị trưởng lão đã thoát khỏi vụ thảm sát Thiếu Lâm tự của triều đình nhà Thanh lúc trước. Thế Ngọc là một đệ tử của Thiếu Lâm, và những chiêu thức võ công Phương Thế Ngọc có thể được coi là có liên quan nhiều tới Thiếu Lâm Hồng gia sau này.`,
                                    videoKey: '4cyYUPne37k'
                                },
                                {
                                    title: 'Phương Thế Ngọc 2',
                                    content: `Phương Thế Ngọc là một tiểu anh hùng trong huyền thoại Trung Hoa, là con trai Phương Đức, một thương gia giàu có, và Miêu Thúy Hoa. Phương Thế Ngọc từ nhỏ đã được rèn luyện võ công từ người mẹ Miêu Thúy Hoa, vốn là con gái của Miêu Hiển, một trong năm vị trưởng lão đã thoát khỏi vụ thảm sát Thiếu Lâm tự của triều đình nhà Thanh lúc trước. Thế Ngọc là một đệ tử của Thiếu Lâm, và những chiêu thức võ công Phương Thế Ngọc có thể được coi là có liên quan nhiều tới Thiếu Lâm Hồng gia sau này.`,
                                    videoKey: 'Qovyeobb03A'
                                },
                                {
                                    title: 'Ỷ Thiên Đồ Long Ký',
                                    content: `Bối cảnh tiểu thuyết lấy vào cuối thời nhà Nguyên, 80 năm sau sự kiện trên đỉnh Hoa Sơn trong Thần điêu hiệp lữ, lúc này nhà Nguyên đang bị suy yếu bởi các cuộc khởi nghĩa và vì sự xa hoa lãng phí của triều đình. Truyện xoay quanh Trương Vô Kỵ và mối tình phức tạp với 4 cô gái, bên cạnh đó là những âm mưu thủ đoạn đầy máu tanh trên giang hồ nhằm chiếm đoạt hai món báu vật là Đồ Long đao và Ỷ Thiên kiếm, với lời đồn nếu tìm được bí mật trong đao kiếm sẽ hiệu triệu được thiên hạ. Truyện kết thúc với sự sụp đổ của nhà Nguyên, người Mông Cổ phải rút về thảo nguyên phía bắc cùng với sự thành lập của nhà Minh bởi Minh Thái Tổ Chu Nguyên Chương. Trương Vô Kỵ là nhân vật chính trong truyện, được xem là có nội tâm phức tạp hơn so với Quách Tĩnh và Dương Quá, điều này làm cho nhân vật trở nên thực tế hơn. Trương Vô Kỵ vào cuối truyện xem Triệu Mẫn là tình yêu của đời mình. Mặc dù có võ công cao cường và là một người chính trực khẳng khái, người có thể truyền cảm hứng cho người khác, song Trương Vô Kỵ không hề có những tố chất cần thiết của một nhà lãnh đạo là lòng ham muốn mãnh liệt đối với quyền lực và tâm kế để duy trì quyền lực. Chính vì vậy vào cuối truyện, anh đã bị Chu Nguyên Chương lừa nên bỏ đi cùng Triệu Mẫn và quyền lực Minh giáo dần rơi vào tay Chu Nguyên Chương, làm bước đệm cho y tranh thiên hạ. Ỷ Thiên Đồ Long Ký là một bộ phim điện ảnh do Hồng Kông sản xuất,phim dựa theo tác phẩm của nhà văn Kim Dung,nói về 2 báu vật trong thiên hạ là Ỷ Thiên Kiếm và Đồ Long Đao,cả hai do Quách Tỉnh đại hiệp luyện thành,2 thanh đao và kiếm ẩn chứa một bí mật rất lớn,giống như tên gọi của nó,ai khám phá được bí mật của Ỷ Thiên Kiếm sẽ làm minh chủ võ lâm,và ai có cơ duyên với Đồ Long Đao sẽ hiệu triệu được thiên hạ.Trong phim Lý Liên Kiệt vào vai Trương Vô Kỵ,con trai của thất hiệp Trương Thúy Sơn và con gái của tà giáo Hân Tố Tố.Trương Vô Kỵ sau khi đại nạn không chết đã luyện thành võ công thượng thừa,hóa giải ân oán trong giang hồ do 2 thanh báu vật gây nên.`,
                                    videoKey: 'Ffhia-VlQqI'
                                },
                                {
                                    title: 'Hoàng Phi Hồng 1',
                                    content: `Nội dung của phim: Trung Hoa cuối thế kỷ 19 rơi vào cảnh loạn lạc, các nước Mỹ, Anh, Pháp liên tục gây sức ép với triều đình. Các băng đảng nổi lên như nấm sau mưa. Hoàng Phi Hồng đứng ra thành lập dân đoàn ở Phật Sơn để làm lực lượng tự vệ, lập lại trật tự. Lương Khoan tìm đến Bảo Chi Lâm xin được thụ giáo võ nghệ với Hoàng Phi Hồng. Là thủ phạm gây ra xung đột giữa dân đoàn của Hoàng Phi với lũ côn đồ ở Sa Hà bang và nhiều hiểu lầm khác, anh bỏ đi làm đệ tử của Nghiêm Chấn Đông, một cao thủ đã luyện được công phu Thiết Bố Sam đao thương bất nhập. Bị Sa Hà bang mua chuộc, Nghiêm Chấn Đông cam tâm bảo vệ để chúng, bắt cóc và lừa bán người Trung Quốc sang Mỹ để làm nô lệ và gái điếm, trong đó có cả dì Thập Tam của Hoàng Phi Hồng. Tuy nhiên, với bản tính thiện lương, Lương Khoan đã mật báo cho Hoàng Phi Hồng và cùng nhau giải cứu nạn nhân. Trận chiến khốc liệt cuối cùng đang chờ họ...`,
                                    videoKey: '1kOPdJICFvY'
                                },
                                {
                                    title: 'Hoàng Phi Hồng 2 ',
                                    content: `Nội dung của phim: Trung Hoa cuối thế kỷ 19 rơi vào cảnh loạn lạc, các nước Mỹ, Anh, Pháp liên tục gây sức ép với triều đình. Các băng đảng nổi lên như nấm sau mưa. Hoàng Phi Hồng đứng ra thành lập dân đoàn ở Phật Sơn để làm lực lượng tự vệ, lập lại trật tự. Lương Khoan tìm đến Bảo Chi Lâm xin được thụ giáo võ nghệ với Hoàng Phi Hồng. Là thủ phạm gây ra xung đột giữa dân đoàn của Hoàng Phi với lũ côn đồ ở Sa Hà bang và nhiều hiểu lầm khác, anh bỏ đi làm đệ tử của Nghiêm Chấn Đông, một cao thủ đã luyện được công phu Thiết Bố Sam đao thương bất nhập. Bị Sa Hà bang mua chuộc, Nghiêm Chấn Đông cam tâm bảo vệ để chúng, bắt cóc và lừa bán người Trung Quốc sang Mỹ để làm nô lệ và gái điếm, trong đó có cả dì Thập Tam của Hoàng Phi Hồng. Tuy nhiên, với bản tính thiện lương, Lương Khoan đã mật báo cho Hoàng Phi Hồng và cùng nhau giải cứu nạn nhân. Trận chiến khốc liệt cuối cùng đang chờ họ...`,
                                    videoKey: 'VHt0TeiRwxc'
                                },
                                {
                                    title: 'Tiếu Ngạo Giang Hồ 2',
                                    content: 'Nội dung của bộ phim: Lấy bối cảnh thời nhà Minh, Tiếu ngạo giang hồ: Đông Phương Bất Bại kể tiếp những cuộc phiêu lưu của Lệnh Hồ Xung cùng cô bạn gái Nhạc Linh San sau khi họ rời khỏi Hoa Sơn vì bị thầy dạy là Nhạc Bất Quần phản bội. Mặc dù Nhạc Linh San đã thầm yêu Lệnh Hồ Xung nhưng Lệnh lại dành tình cảm của anh cho Nhâm Doanh Doanh, người có cha là Nhâm Ngã Hành, giáo chủ Nhật Nguyệt thần giáo trước khi bị Đông Phương Bất Bại lật đổ. Mặc dù là đàn ông nhưng do luyện Quỳ Hoa bảo điển, Đông Phương Bất Bại dần mang tướng mạo của một phụ nữ, trong một lần tình cờ đụng độ, Lệnh Hồ Xung đã tỏ lòng mến mộ Đông Phương Bất Bại và kết bạn với kẻ đại ác này. Nhưng sự thật cuối cùng bị phơi bày và Lệnh Hồ Xung phải gạt tình cảm riêng để tiêu diệt Đông Phương Bất Bại vì sự bình an của thiên hạ.',
                                    videoKey: 'dbxutCYqovE'
                                },
                                {
                                    title: 'Cận Vệ Nam Trung Hải',
                                    content: 'Bộ phim là nhân vật chính của Allan, một vệ sĩ chuyên nghiệp có trụ sở tại Bắc Kinh có kỹ năng chiến thuật và võ thuật và tư duy nhanh nhạy được thể hiện là đã bảo vệ một số chính khách khỏi bị ám sát. Anh ta được James, một doanh nhân giàu có ở Hồng Kông thuê để bảo vệ bạn gái xinh đẹp Michelle Leung, người là nhân chứng duy nhất còn sống sót trong một vụ giết người, sau khi tất cả những người khác đã bị loại bỏ theo nhiều cách khác nhau. Allan đến nhà của cô gái ở Hồng Kông để gặp hai nhân viên cảnh sát mặc thường phục có phần bất tài - Fat Po và Ken - phụ trách sự an toàn của cô. Ngay sau khi gặp cô Leung, anh ta chứng minh toàn bộ đội ngũ vệ sĩ hiện tại không có khả năng chiến đấu với họ trong suốt thời gian anh ta nghĩ là một vụ ám sát, và tất cả họ đều bị sa thải. Anh ta cũng giải giới cả cảnh sát. Vệ sĩ kiểm tra toàn bộ ngôi nhà và các phương tiện để tìm lỗi, bom và bố trí, và lắp đặt camera an ninh ở nhiều khu vực khác nhau, bao gồm cả phòng ngủ của Michelle, nơi anh ta có thể theo dõi thông qua một thiết bị cá nhân. Cô ấy không hài lòng về điều này và, sau khi cố gắng không thành công để ra lệnh cho anh ta, quản lý để đánh sập máy ảnh bằng chảo rán. Anh cũng cho cô một nút hoảng loạn.',
                                    videoKey: 'yOSlEIzVtW4'
                                },
                                {
                                    title: 'LÁ THƯ CHO PHỤ THÂN',
                                    content: `LÁ THƯ CHO PHỤ THÂN`,
                                    videoKey: 'aZVeLeP5OBw'
                                },
                                {
                                    title: 'Anh Hùng Tái Xuất',
                                    content: `Anh Hùng Tái Xuất`,
                                    videoKey: 'kLJHpsQfGOM'
                                },
                                {
                                    title: 'THÁI CỰC TRƯƠNG TAM PHONG',
                                    content: `THÁI CỰC TRƯƠNG TAM PHONG`,
                                    videoKey: '7KuL-y6110s'
                                },
                                {
                                    title: 'Thiếu Lâm Tự 2',
                                    content: 'Phim Thiếu Lâm Tự 2 được sản xuất năm 1984, được coi như phần 2 của bộ phim Thiếu Lâm Tự nổi tiếng trước đó. Lý Liên Kiệt một lần nữa hợp tác với đạo diễn Trương Hâm Viên và các bạn diễn võ thuật nổi tiếng trong Thiếu Lâm tự như Vu Thừa Huệ, Vu Hải, Kế Xuân Hoa. Thiếu Lâm tiểu tử là một bộ phim rất thành công của Lý Liên Kiệt khi đạt doanh thu phòng vé đại lục cao chỉ kém Thiếu Lâm Tự, series Hoàng Phi Hồng, Anh Hùng và Hoắc Nguyên Giáp trong số các phim anh tham gia.',
                                    videoKey: '7IcZG44xeMA'
                                },
                                {
                                    title: 'Quán Trọ Sát Thủ',
                                    content: 'Quán Trọ Sát Thủ',
                                    videoKey: '96YOzJvWcsw'
                                },
                                {
                                    title: 'ANH HÙNG THỜI LOẠN',
                                    content: 'ANH HÙNG THỜI LOẠN',
                                    videoKey: 'dj-tTx6OL4o'
                                },
                                {
                                    title: 'Long Môn Phi Giáp',
                                    content: 'Long Môn Phi Giáp',
                                    videoKey: '6KLkQHZB6Bc'
                                },
                                 {
                                    title: 'Hồng Hy Quan',
                                    content: `Phim Lý Liên Kiệt | Hồng Hy Quan | Phim Võ Thuật Cổ Trang Hay Nhất`,
                                    videoKey: 'ckBb2HJh7V0'
                                },
                                
                            ]
                        },
                        {
                            name: 'THÀNH LONG',
                            image: '',
                            filmList:
                            [
                                {
                                    title: 'CON ĐƯỜNG TƠ LỤA',
                                    content: `Phim thành long | CON ĐƯỜNG TƠ LỤA FULL HD | Phim hành động hay nhất 2018`,
                                    videoKey: 'ctTWbnAtISM'
                                },
                                // {
                                //     title: '',
                                //     content: ``,
                                //     videoKey: ''
                                // },
                                // {
                                //     title: '',
                                //     content: ``,
                                //     videoKey: ''
                                // },
                                // {
                                //     title: '',
                                //     content: ``,
                                //     videoKey: ''
                                // },
                                {
                                    title: '12 Con giáp',
                                    content: `12 Con giáp - Phim Hài Thành Long Hay HD - Thuyết minh`,
                                    videoKey: 'yJfNm0b3Xw8'
                                },
                                {
                                    title: 'Đặc Vụ Mê Thành',
                                    content: `Đặc Vụ Mê Thành [Thuyết Minh] || Phim Hành Động Thành Long Siêu Hay - Siêu Hot || Full HD`,
                                    videoKey: 'svIJmA98ivI'
                                },
                                {
                                    title: 'THẦN THOẠI (2005)',
                                    content: `THẦN THOẠI (2005)`,
                                    videoKey: 'LTaKV1-J4qw'
                                },
                                {
                                    title: 'Đảo Lửa',
                                    content: `Đảo Lửa`,
                                    videoKey: 'YhOX6_IWvI0'
                                },
                                {
                                    title: 'Kế hoạch Baby',
                                    content: `Kế hoạch Baby`,
                                    videoKey: 'W5Q55RT3N8A'
                                },
                                {
                                    title: 'SIÊU CẢNH SÁT',
                                    content: `SIÊU CẢNH SÁT`,
                                    videoKey: 'dioBNlWdmeA'
                                },
                                {
                                    title: 'TÔI LÀ AI',
                                    content: `TÔI LÀ AI`,
                                    videoKey: '1Bin80Oa6cc'
                                },
                                {
                                    title: 'Kế Hoạch Phi Ưng II',
                                    content: `Kế Hoạch Phi Ưng II`,
                                    videoKey: 'sD1AtcgI4FU'
                                },
                                {
                                    title: 'Câu Chuyện Cảnh Sát 3',
                                    content: `Câu Chuyện Cảnh Sát 3`,
                                    videoKey: '6lcdaNH0McY'
                                },
                                {
                                    title: 'Rồng Bất Tử',
                                    content: `Rồng Bất Tử`,
                                    videoKey: 'V-OP1ofQYaU'
                                },
                                 {
                                    title: 'Ngôi sao may mắn',
                                    content: `Ngôi sao may mắn - Thành Long `,
                                    videoKey: 'f4mK6iU86wQ'
                                },
                                {
                                    title: 'Thợ Săn Thành Phố',
                                    content: `Thợ Săn Thành Phố`,
                                    videoKey: 'vSQUKwB7uhM'
                                },
                                {
                                    title: 'Túy Quyền 2',
                                    content: `Túy Quyền 2`,
                                    videoKey: '43BM-VDZexM'
                                },
                                {
                                    title: 'Xà Quyền',
                                    content: `Xà Quyền - Phim hay thành long`,
                                    videoKey: 'YcKs1jhzOKU'
                                },
                                {
                                    title: 'Quảng Đông Tiểu Lão Hổ',
                                    content: `Quảng Đông Tiểu Lão Hổ- Thành Long || Phim Võ Thuật Kinh Điển Hồng Kông`,
                                    videoKey: 'J57z5SI1UgY'
                                },
                                {
                                    title: 'Đại Náo Phố',
                                    content: `Phim Thành Long - Đại Náo Phố`,
                                    videoKey: '_Z9yIU__C2o'
                                },
                                {
                                    title: 'Quyền Tinh (Ngũ Quỷ)',
                                    content: `Quyền Tinh (Ngũ Quỷ) 1978 - Thành Long (DVT)`,
                                    videoKey: 'uKAUTOwrKeg'
                                },
                                // {
                                //     title: '',
                                //     content: ``,
                                //     videoKey: ''
                                // },
            
                            ]
                        },
                        {
                            name: 'CHUNG TỬ ĐƠN',
                            image: '',
                            filmList:
                            [
            
                                {
                                    title: 'KIẾM KHÁCH',
                                    content: `KIẾM KHÁCH`,
                                    videoKey: 'H6l7aaHWptY'
                                },
                                {
                                    title: 'Sát Quyền',
                                    content: `Sát Quyền`,
                                    videoKey: 'mVO_UE60imU'
                                },
                                {
                                    title: 'Diệp Vấn 1',
                                    content: `Diệp Vấn 1`,
                                    videoKey: 'S6an0Q3reF8'
                                },
                                {
                                    title: 'Tiêu Diệt Nhân Chứng',
                                    content: `Tiêu Diệt Nhân Chứng`,
                                    videoKey: 'm3_al1fMbhs'
                                },
                                {
                                    title: 'Đặc Cảnh Á Châu',
                                    content: `Đặc Cảnh Á Châu`,
                                    videoKey: '3XwE5RNipCk'
                                },
                                {
                                    title: 'Thân Phận Đặc Biệt ',
                                    content: `Thân Phận Đặc Biệt`,
                                    videoKey: 'xGn70_QNaIk'
                                },
                                {
                                    title: 'Quán Trọ Sát Thủ',
                                    content: `Quán Trọ Sát Thủ`,
                                    videoKey: 'rnvRML5RoOA'
                                },
                                {
                                    title: 'ÔNG TRÙM BẾN CẢNG',
                                    content: `ÔNG TRÙM BẾN CẢNG`,
                                    videoKey: 'n9r-u3sz9X8'
                                },
            
                                {
                                    title: 'Quan Vân Trường',
                                    content: `Quan Vân Trường`,
                                    videoKey: '5j0QWIF1JZQ'
                                },
            
                                {
                                    title: 'TÂN LONG MÔN',
                                    content: `TÂN LONG MÔN`,
                                    videoKey: 'YwZvm9gkywE'
                                },
            
                                {
                                    title: 'Thiết Hầu Công',
                                    content: `Thiết Hầu Công✔ Phim võ thuật Trung Quốc`,
                                    videoKey: 'zV-L1Ir8tIM'
                                },
                                {
                                    title: 'Thần Cước',
                                    content: `Thần Cước`,
                                    videoKey: 'Obuc2YPR5RM'
                                },
                                {
                                    title: 'Long Hổ Môn Full HD',
                                    content: `Long Hổ Môn Full HD`,
                                    videoKey: 'H9boZaznSb0'
                                },
                                {
                                    title: 'Chiến Lang Truyền Thuyết',
                                    content: 'Phim Chiến Lang Truyền Thuyết Full HD (Lồng Tiếng) Chung Tử Đơn Võ Thuật Đỉnh Cao',
                                    videoKey: 'DA-kNyBW69c'
                                },
                                {
                                    title:'Tân Long Môn Khách Điếm',
                                    content:'Phim Tân Long Môn Khách Điếm Full HD (Lồng Tiếng) Chung Tử Đơn_Lâm Thanh Hà',
                                    videoKey: 'buaOh2k27l8'
                                },
                                {
                                    title: 'Biệt Đội Săn Báu Vật',
                                    content: `Phim Chung Tử Đơn Mới Nhất - Biệt Đội Săn Báu Vật | Phim Võ Thuật Hay Nhất`,
                                    videoKey: 'GmZcEJtB8Gs'
                                },
                                {
                                    title: 'Hoa Đô Đại Chiến',
                                    content: `Thành Long vs Chung Tử Đơn- Hoa Đô Đại Chiến Full HD Thuyết minh`,
                                    videoKey: 'yODIb210Enk'
                                },
                                {
                                    title: 'Vệ sỹ và sát thủ',
                                    content: `Vệ sỹ và sát thủ thuyết minh CHUNG TỬ ĐƠN CUNG LE Phim Hành Động Hay`,
                                    videoKey: 'Wd7QO1ICv8k'
                                },
                                // {
                                //     title: '',
                                //     content: ``,
                                //     videoKey: ''
                                // },
                                // {
                                //     title: '',
                                //     content: ``,
                                //     videoKey: ''
                                // },
                                // {
                                //     title: '',
                                //     content: ``,
                                //     videoKey: ''
                                // },
                                
                            ]
                        },
                        {
                            name: 'NGÔ KINH',
                            image: '',
                            filmList:
                            [
            
                                {
                                    title: 'Chiến Lang 2',
                                    content: `Ngô Kinh | Chiến Lang 2 - Phim hành động võ thuật mới hay nhât 2019 | Phim thuyết minh`,
                                    videoKey: 'b'
                                },
            
                                {
                                    title: 'Hầu Tửu Quyền',
                                    content: `Hầu Tửu Quyền - Ngô Kinh`,
                                    videoKey: 'a8Sv0YecIEE'
                                },
            
                                {
                                    title: 'Tội Phạm Nguy Hiểm',
                                    content: ` Ngô Kinh Tội Phạm Nguy Hiểm Thuyết minh | Phim hay`,
                                    videoKey: 'UbNhwb3nXyE'
                                },
            
                                {
                                    title: 'Thái Cực Quyền',
                                    content: `Phim Thái Cực Quyền Full HD (Lồng Tiếng)_ Ngô Kinh_Chung Lệ Đề`,
                                    videoKey: 'lyvkAGOmxvU'
                                },
                                {
                                    title: 'Phổ Thành Huyết Chiến',
                                    content: `Phổ Thành Huyết Chiến Cổ Thiên Lạc Ngô Kinh Phim hành động võ thuật quá hay`,
                                    videoKey: 'WOKopSX_zTg'
                                },
                                {
                                    title: 'CHIẾN LANG 1',
                                    content: 'CHIẾN LANG 1 - PHIM HÀNH ĐỘNG CỰC HAY',
                                    videoKey: 'LNIcWxnKNlw'
                                }
            
                            ]
                        },
                        {
                            name: 'PHIM MA CƯƠNG THI',
                            image: '',
                            filmList:
                            [
                                {
                                    title: 'Cương Thi Hồi Sinh',
                                    content: ``,
                                    videoKey: 'FGAg-foGwns'
                                },
                                {
                                    title: 'Cương Thi Biến Thể',
                                    content: `Cương Thi Biến Thể [HD Lồng Tiếng]- LÂM CHÁNH ANH || Phim Ma Cương Thi Hồng Kông`,
                                    videoKey: 'J-UsZ7uG5fg'
                                },
                                {
                                    title: 'Đặc cảnh diệt ma',
                                    content: ``,
                                    videoKey: 'dTOXhUbuktc'
                                },
                                {
                                    title: 'Ma Cương Thi Dễ Thương',
                                    content: ``,
                                    videoKey: 'gUrisxQtFyA'
                                },
                                {
                                    title: 'CƯƠNG THI ĐẦU ĐÀN',
                                    content: ``,
                                    videoKey: '46jUUEtNOgQ'
                                },
                                 {
                                    title: 'Nhân Qủy Thần',
                                    content: ``,
                                    videoKey: 'zG_1nwY4Gfc'
                                },
                                {
                                    title: 'Tiên nữ trong tranh',
                                    content: ``,
                                    videoKey: 'oMTSTAxURQM'
                                },
                                {
                                    title: 'TRUY TÌM CỔ MỘ ',
                                    content: `TRUY TÌM CỔ MỘ - Phim Hành Động Hài LƯU ĐỨC HOA 2018 - Phim Cực Hay`,
                                    videoKey: 'DhtWCGa2wHY'
                                },
                                {
                                    title: 'Nhất My Đạo Nhân',
                                    content: `hất My Đạo Nhân 1989 - Phim Ma Chuối Lâm Chánh Anh`,
                                    videoKey: 'LQM0LKQQbik'
                                },
                                {
                                    title: 'Ngũ phúc tinh gặp ma',
                                    content: `Phim hài Hồng Kim Bảo - Ngũ phúc tinh gặp ma - Lồng Tiếng`,
                                    videoKey: 'Gw_tbLQFmqo'
                                },
                                {
                                    title: 'Hồ Ly Tinh',
                                    content: `Hồ Ly Tinh`,
                                    videoKey: '-aJDgM0jpXc'
                                },
                                {
                                    title: 'Huyền Sử Diệt Ma',
                                    content: `Huyền Sử Diệt Ma`,
                                    videoKey: 'gEHxQlf7HnM'
                                },
                                {
                                    title: 'Ma Nữ Hút Máu',
                                    content: `Ma Nữ Hút Máu - Phim Hài Ma Cương Thi Lâm Chánh Anh`,
                                    videoKey: 'ErqgOHrK_3A'
                                },
                                {
                                    title: 'Thần Đao Trảm Bát Quỷ',
                                    content: `Thể Loại phim ma của hongkong Với sự diễn xuất của diễn viên Tiền Tiểu Hào. Ngọ Mã. Vương Tổ Hiền v.v`,
                                    videoKey: '0U7zkBUbSN4'
                                },
                                {
                                    title: 'Thầy Rởm Bắt Ma',
                                    content: `Thầy Rởm Bắt Ma - Phim Ma Kinh Dị Hài Hước`,
                                    videoKey: 'vrsNtxrJynE'
                                },
                                {
                                    title: 'Lời Nguyền Cương Thi',
                                    content: `Lời Nguyền Cương Thi`,
                                    videoKey: '-xziknni8Dw'
                                },
                                {
                                    title: 'Thiên địa huyền Môn',
                                    content: `Thiên địa huyền Môn`,
                                    videoKey: '7FKNyw1W4xM'
                                },
                                {
                                    title: 'Bào Thai Quỷ Quái',
                                    content: `Bào Thai Quỷ Quái- TRƯƠNG CẨM TRÌNH, NGÔ THẦN QUÂN || Phim Ma, Kinh Dị HK Hay`,
                                    videoKey: 'twoROuwo1YI'
                                },
                                
                                
                            ]
                        },
                        {
                            name: 'PHIM HAY KHÁC',
                            image: '',
                            filmList:
                            [
            
                                {
                                    title: 'Chuyện Tình Cúp Cua',
                                    content: `Chuyện Tình Cúp Cua (HD Lồng Tiếng)- Lâm Chí Dĩnh, Trương Vệ Kiện`,
                                    videoKey: 'Yt_4L5SaaRk'
                                },
                                {
                                    title: 'Hỏa Thiêu Hồng Liên Tự',
                                    content: `Hỏa Thiêu Hồng Liên Tự`,
                                    videoKey: '4PlzF2e7zlk'
                                },
            
                                {
                                    title: 'Hắc Hiệp Đại Chiến Thánh Bài',
                                    content: `Hắc Hiệp Đại Chiến Thánh Bài`,
                                    videoKey: 'TD3ujrTa5Ac'
                                },
            
                                {
                                    title: 'Tú Xuân Đao',
                                    content: `Tú Xuân Đao`,
                                    videoKey: 'DhFpBjmsmnU'
                                },
            
                                {
                                    title: 'ĐẠI TIẾU GIANG HỒ',
                                    content: `ĐẠI TIẾU GIANG HỒ 2017 - Phim hài hay nhất 2017, Thuyết minh + vietsub`,
                                    videoKey: 'UR2cDYjH9Fg'
                                },
            
                                {
                                    title: 'Quán Trọ Thần Tài',
                                    content: `Quán Trọ Thần Tài (Full HD Thuyết Minh) `,
                                    videoKey: 'rYmoeAf8v44'
                                },
            
                                {
                                    title: 'Bác Sĩ Lưu Manh',
                                    content: `|HD 720p| Bác Sĩ Lưu Manh - Lương Triều Vỹ ll Chung Lệ Đề`,
                                    videoKey: 'zamdgVMxg9Y'
                                },
            
                                {
                                    title: 'Thần bài 1-Châu Nhuận Phát',
                                    content: `Thần bài 1-Châu Nhuận Phát`,
                                    videoKey: 'NBKVQC4g8tA'
                                },
            
                                {
                                    title: 'Thần bài 2-Châu Nhuận Phát',
                                    content: `Thần bài 2-Châu Nhuận Phát`,
                                    videoKey: '_9nab_FVkb4'
                                },
            
                                {
                                    title: 'LÁ BÀI ĐỔI MẠNG',
                                    content: `LÁ BÀI ĐỔI MẠNG`,
                                    videoKey: 'Kx1WvrpS0Tw'
                                },
            
                                {
                                    title: 'Như Lai Thần Chưởng ',
                                    content: `Phim Hong Kong - Như Lai Thần Chưởng - Lưu Đức Hoa`,
                                    videoKey: 'IScQ-PwEJjk'
                                },
            
                                {
                                    title: 'Nộ Hải Hùng Phong',
                                    content: `PHIM CỔ TRANG | Hoàng Phi Hồng 2 - Nộ Hải Hùng Phong - The Unity of Heroes 2`,
                                    videoKey: '4C5uNJ6rDgg'
                                },
            
                                {
                                    title: 'ĐIỆP HUYẾT SONG THÀNH',
                                    content: `PHIM CỔ TRANG - ĐIỆP HUYẾT SONG THÀNH`,
                                    videoKey: 'jsAys4_4BhA'
                                },
            
                                {
                                    title: 'NGƯỜI TRONG GIANG HỒ',
                                    content: `Phim XÃ HỘI ĐEN HỒNG KÔNG`,
                                    videoKey: 'etmUq8dMlNI'
                                },
            
                                {
                                    title: 'Người Trong Giang Hồ 3',
                                    content: `Người Trong Giang Hồ 3`,
                                    videoKey: '43WlPNUgOi4'
                                },
            
                                {
                                    title: 'Người Trong Giang Hồ 6',
                                    content: `Người Trong Giang Hồ 6 - Kẻ Thắng Làm Vua`,
                                    videoKey: 'hHjUojepPUo'
                                },
            
                                {
                                    title: 'Người Trong Giang Hồ 7',
                                    content: `Người Trong Giang Hồ 7 - Thời Thiếu Niên Trần Hạo Nam`,
                                    videoKey: '_oApqfIEUEw'
                                },
            
                                {
                                    title: 'Người Trong Giang Hồ 8',
                                    content: `Người Trong Giang Hồ 8`,
                                    videoKey: 'o6OehG7oY4w'
                                },
                                
                                {
                                    title: 'Hoàng Phi Hồng - Hồng Kim Bảo',
                                    content: `Hoàng Phi Hồng - Hồng Kim Bảo`,
                                    videoKey: '_ss8tWHNj4U'
                                },
            
                                {
                                    title: 'Thập Đại Ác Nhân',
                                    content: `Thập Đại Ác Nhân Đại Cao Thủ Lưu Đức Hoa `,
                                    videoKey: '52YcWtWWQcY'
                                },
            
                                {
                                    title: 'Bá Vương Tà Giáp',
                                    content: `Bá Vương Tà Giáp Bury Me High Lồng Tiếng`,
                                    videoKey: 'w4WbGk1f1BM'
                                },
            
                                {
                                    title: 'Đội Sát Thủ Thiếu Niên',
                                    content: `Đội Sát Thủ Thiếu Niên - Phim Hành Động Hài`,
                                    videoKey: 'WrEEKcHwtpQ'
                                },
            
                                {
                                    title: 'THẦN BÀI TRỞ LẠI ',
                                    content: `THẦN BÀI TRỞ LẠI `,
                                    videoKey: 'Ul3t2IcfGrM'
                                },
            
                                {
                                    title: 'Thần bài 5',
                                    content: `Thần bài 5 - Full HD `,
                                    videoKey: 'QD_fbwYI53s'
                                },
                                {
                                    title: 'Phim Hài_ Bất Phân Thắng Bại',
                                    content: `Phim Hài_ Bất Phân Thắng Bại 1990 _Lồng Tiếng`,
                                    videoKey: 'lBgxwdOkhig'
                                },
                                {
                                    title: ' Đại Nội Mật Thám 009 - Cổ Thiên Lạc',
                                    content: ` Đại Nội Mật Thám 009 - Cổ Thiên Lạc - Từ Hy Viên`,
                                    videoKey: 'QhM4vbjd7F8'
                                },
                                {
                                    title: 'Địch Nhân Kiệt 1: Thông Thiên Đế Quốc',
                                    content: `Địch Nhân Kiệt 1: Thông Thiên Đế Quốc`,
                                    videoKey: 'tjoIFTbLBEc'
                                },
                                {
                                    title: 'Địch Nhân Kiệt 2: Tứ đại thiên vương',
                                    content: `Địch Nhân Kiệt 2: Tứ đại thiên vương`,
                                    videoKey: 'Mdz6y3EexeY'
                                },
                                {
                                    title: 'Chiến Quốc - Thuyết Minh',
                                    content: `Chiến Quốc - Thuyết Minh`,
                                    videoKey: '239e8s-ihZ4'
                                },
                                {
                                    title: 'Tứ đại danh bổ 2',
                                    content: `Tứ đại danh bổ 2 - Lưu diệc Phi`,
                                    videoKey: 'OObwQCEAtmA'
                                },
                                {
                                    title: 'Hồng Trường Phi Long',
                                    content: `Hồng Trường Phi Long- HỨA QUÁN KIỆT, TRƯƠNG MẠN NGỌC || Phim Hành Động Võ Thu`,
                                    videoKey: 'gwzQEqHtn5k'
                                },
                                {
                                    title: 'Thiên Sứ Hành Động',
                                    content: `Thiên Sứ Hành Động- Lý Thái Phụng, Yukari Oshima || Phim Hành Động Hồng Kông Xưa`,
                                    videoKey: 'V9IimDqwzE8'
                                },
                                {
                                    title: 'Hoàng Gia Sư Tỷ',
                                    content: `Hoàng Gia Sư Tỷ (HD Vietsub)- Dương Tử Quỳnh, Cynthia Rothrock || Phim Hành Động Võ`,
                                    videoKey: 'coBu9N9R8mg'
                                },
                                {
                                    title: 'Báo Săn Mồi',
                                    content: `Báo Săn Mồi (HD Thuyết Minh)- Lương Tranh, Nguyên Hoa || Phim Hành Động Hồng Kông`,
                                    videoKey: 'nZ21_1YGAQI'
                                },
                                 {
                                    title: 'Tiêủ Tử Thiếu Lâm 2',
                                    content: `Tiêủ Tử Thiếu Lâm 2 (HD Lồng Tiếng)- Thích Tiểu Long, Hác Thiệu Văn`,
                                    videoKey: 'V6QUUAw4GSU'
                                },
                                {
                                    title: 'Long Đằng Tứ Hải',
                                    content: `Long Đằng Tứ Hải- ĐẶNG QUANG VINH, LƯU ĐỨC HOA, NHẬM ĐẠT HOA`,
                                    videoKey: 'zVxfgrlVp5E'
                                },
                                {
                                    title: 'Thánh Hiệp (Lồng Tiếng)',
                                    content: `Thánh Hiệp (Lồng Tiếng)- Lưu Đức Hoa, Quan Chi Lâm_ Phim Hành Động Hồng Kông Hay`,
                                    videoKey: 'gFJHYltORa0'
                                },
                                 {
                                    title: 'Thánh Hiệp 2 (Lồng Tiếng)',
                                    content: `Thánh Hiệp 2 (Lồng Tiếng)- Lưu Đức Hoa, Lương Gia Huy || Phim Hành Động`,
                                    videoKey: 'DmyKOtZyizg'
                                },
                                {
                                    title: 'Hình Cảnh Bạo Lực',
                                    content: `Hình Cảnh Bạo Lực - VƯƠNG MẪN ĐỨC, HUỲNH THU SANH`,
                                    videoKey: 'YVIyCjfGW0I'
                                },
                                {
                                    title: 'Cao Thủ Mạc Chược',
                                    content: `Cao Thủ Mạc Chược - QUÁCH TẤN AN, NGUYÊN HOA || Phim Hành Động Hài HK Hay`,
                                    videoKey: 'OEX_5ZSZYOA'
                                },
                                {
                                    title: 'Hỏa Vân Tà Thần',
                                    content: `Hỏa Vân Tà Thần- LÂM THANH HÀ, MẠC THIẾU THÔNG || Phim Võ Thuật Kiếm Hiệp`,
                                    videoKey: '9Z_IgXzgYVo'
                                },
                                {
                                    title: 'Bích huyết kiếm',
                                    content: `Tân Bích Huyết Kiếm 1993: Hạ tuyết nghi vì muốn đạt được mục đích trả thù mà lợi dụng tình cảm của một người phụ nữ sau đó cướp lấy báu vật của cô, ông tính trả thù ôn lão gia nhưng lại đem tình cảm của mình trao cho con gái ông ta, bị ôn lão gia mai phục, ông bị thương phải về hoa sơn chữa trị, gặp được một thanh niên mà ông nuôi dạy từ nhỏ, ông truyền võ công và giao nhiệm vụ trả thù cho cậu, cùng xem phim thôi.`,
                                    videoKey: 'ZurdpRLNrcE'
                                },
                                {
                                    title: 'Nữ Hiệp',
                                    content: `Phim lẻ hongkong xưa hay Nữ Hiệp HD 720 lồng tiếng 18+`,
                                    videoKey: 'hZDnbEo6kmA'
                                },
                                {
                                    title: 'Ngục Tù Mãnh Long',
                                    content: `Phim Ngục Tù Mãnh Long Full HD (Lồng Tiếng) Lưu Đức Hòa_Hà Gia Kính`,
                                    videoKey: 'H8tCaCMmxew'
                                },
                                {
                                    title: 'Lưu Tinh Hồ Điệp Kiếm',
                                    content: `Phim Tân Lưu Tinh Hồ Điệp Kiếm (Lồng Tiếng) Bản Đẹp Chung Tử Đơn Lương Triều Vỹ`,
                                    videoKey: 'CJqFgEvEfcc'
                                },
                                {
                                    title: 'Nợ Giang Hồ',
                                    content: `Phim Nợ Giang Hồ Full HD Lồng Tiếng Châu Nhuận Phát Lưu Đức Hòa`,
                                    videoKey: 'JD7gIugXYhs'
                                },
                                {
                                    title: 'Chí Tôn Vô Thượng',
                                    content: `Phim Chí Tôn Vô Thượng Full HD (Lồng Tiếng) Lưu Đức Hòa_Quan Chi Lâm`,
                                    videoKey: 'u0GNt10HUiU'
                                },
                                {
                                    title: 'Đại Ca Phi Long',
                                    content: `Phim XHĐ - Đại Ca Phi Long - Lưu Đức Hoa, Cổ Thiên Lạc, Đàm Diệu Văn, Huỳnh Thu Sinh`,
                                    videoKey: 'RuuLHMexxCo'
                                },
                                {
                                    title: 'Dục Vọng',
                                    content: `Dục Vọng`,
                                    videoKey: 'OBBNYxbrwdw'
                                },
                                {
                                    title: 'Bao thanh Thiên',
                                    content: `Bao thanh Thiên.lưu đức Hoa.lồng tiếng phim lẻ hongkong hay nhất`,
                                    videoKey: 'H5YaLJH_HFk'
                                },
                                {
                                    title: 'Trạng Nguyên Luận Văn Tự',
                                    content: `Trạng Nguyên Luận Văn Tự`,
                                    videoKey: 'mvIig8K4oTI'
                                },
                                {
                                    title: 'Thần Bài Du Côn',
                                    content: `Phim lồng tiếng - Thần Bài Du Côn`,
                                    videoKey: 'lNQvHCp9l8E'
                                },
                                {
                                    title: 'Võ thuật hiện đại',
                                    content: `Phim võ thuật hài hước mới nhất hay khong che`,
                                    videoKey: 'YCzqXoGjlCg'
                                },
                                {
                                    title: 'THIẾU NIÊN ANH HÙNG',
                                    content: `THIẾU NIÊN ANH HÙNG VÕ THUẬT THIẾU LÂM TỰ PHIM VÕ THUẬT KIÊM HIỆP PHIM LẺ`,
                                    videoKey: 'Sza817wd-zg'
                                },
                                {
                                    title: 'Vi tiểu bảo vượt thời gian',
                                    content: `Phim lẻ Hài - Vi tiểu bảo vượt thời gian và THỊT luôn hoàng hậu`,
                                    videoKey: '3LTjVClw-1g'
                                },
                                {
                                    title: 'TÂN TIÊN HẠC THẦN CHÂM',
                                    content: `TÂN TIÊN HẠC THẦN CHÂM FULL HD | PHIM KIẾM HIỆP VÕ THUẬT HỒNG KÔNG - LƯƠNG TRIỀU VỸ, MAI DIỄM PHƯƠNG`,
                                    videoKey: 'QitBZCAoTjU'
                                },
                                {
                                    title: 'Phi Hồ Truyền Kỳ',
                                    content: `Phi Hồ Truyền Kỳ - The Sword Of Many Lovers 1993 (Lê Minh - Trương Mẫn - Lý Gia Hân)`,
                                    videoKey: 'Fr6sthtzT10'
                                },
                                {
                                    title: 'Bất Phân Thắng Bại',
                                    content: `Phim Hài_ Bất Phân Thắng Bại 1990 _Lồng Tiếng`,
                                    videoKey: 'lBgxwdOkhig'
                                },
                                {
                                    title: 'Hoàng Phi Hồng: Nam Bắc Anh Hùng',
                                    content: `Hoàng Phi Hồng: Nam Bắc Anh Hùng - The Unity of Heroes 2018`,
                                    videoKey: 'BvxAVcW0Mps'
                                },
                                {
                                    title: 'Bạn Hữu Tình Trường',
                                    content: `Phim Hài Hongkong_Bạn Hữu Tình Trường ( Lưu Đức Hoa.Quan Chi Lâm.Khưu Thục Trinh)`,
                                    videoKey: 'LkK8vmmn468'
                                },
                                {
                                    title: 'Vua Mạo Hiểm Vệ Tư Lý',
                                    content: `Phim Vua Mạo Hiểm Vệ Tư Lý 1987_ Lồng Tiếng`,
                                    videoKey: 'BKYvptfXq5o'
                                },
                                {
                                    title: 'Ngoại Truyện Nữ Nhi Quốc',
                                    content: `Phim Tây Du Ký || Ngoại Truyện Nữ Nhi Quốc (Thuyết Minh)`,
                                    videoKey: 'jUvBHvy9Ojs'
                                },
                                // {
                                //     title: '',
                                //     content: ``,
                                //     videoKey: ''
                                // },
                                // {
                                //     title: '',
                                //     content: ``,
                                //     videoKey: ''
                                // },
                                // {
                                //     title: '',
                                //     content: ``,
                                //     videoKey: ''
                                // },
                                // {
                                //     title: '',
                                //     content: ``,
                                //     videoKey: ''
                                // },
                                // {
                                //     title: '',
                                //     content: ``,
                                //     videoKey: ''
                                // },
                            ]
                        }
                    ]
                );
})
