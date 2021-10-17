using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Firebase.Auth;
using Firebase.Storage;
using System.IO;
using System.Threading;
using System.Threading.Tasks;

namespace ProyectoVialidadASP.Models
{
    public class File_model
    {
        private static readonly string ApiKey = "AIzaSyCBFd0AMdAS2BFA_ICfemfEMMGq97-vRWA";
        private static readonly string Bucket = "proyectovialidadasp.appspot.com";
        private static readonly string AuthEmail = "pruebaimagenes@gmail.com";
        private static readonly string AuthPassword = "123456";
        public async void Upload(FileStream stream, string fileName)
        {
            var auth = new FirebaseAuthProvider(new FirebaseConfig(ApiKey));
            var a = await auth.SignInWithEmailAndPasswordAsync(AuthEmail, AuthPassword);

            var cancelation = new CancellationTokenSource();

            var task = new FirebaseStorage(
                Bucket,
                new FirebaseStorageOptions
                {
                    AuthTokenAsyncFactory = () => Task.FromResult(a.FirebaseToken),
                    ThrowOnCancel = true
                })
                .Child("images")
                .Child(fileName)
                .PutAsync(stream, cancelation.Token);
            try
            {
                string link = await task;
            }
            catch (Exception ex)
            {

                Console.WriteLine("Exception was thrown: {0}", ex);
            }
        }
    }
}