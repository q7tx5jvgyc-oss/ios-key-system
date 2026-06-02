#import <UIKit/UIKit.h>

// الدالة الأساسية التي تعمل فور تشغيل اللعبة
__attribute__((constructor)) static void initialize_key_system() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 1. إنشاء النافذة المنبثقة للتحقق
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"نظام التحقق"
                                                                       message:@"الرجاء إدخال مفتاح التفعيل الخاص بقناتنا لتشغيل اللعبة"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        // 2. إضافة حقل النص لكتابة المفتاح
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"أدخل المفتاح هنا...";
            textField.secureTextEntry = YES; // إخفاء المفتاح أثناء الكتابة لحمايته
        }];
        
        // 3. إضافة زر التأكيد والتحقق من المفتاح الخاص بك
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"دخول" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UITextField *keyField = alert.textFields.firstObject;
            
            // التحقق من المفتاح الخاص بك
            if ([keyField.text isEqualToString:@"MOSTAHAU9801"]) {
                // المفتاح صحيح: تختفي الواجهة وتفتح اللعبة فوراً
                NSLog(@"Access Granted!");
            } else {
                // المفتاح خاطئ: يتم إغلاق اللعبة تلقائياً لحماية حقوقك
                exit(0); 
            }
        }];
        
        [alert addAction:confirm];
        
        // عرض النافذة فوق واجهة اللعبة الرئيسية تلقائياً
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    });
}
 
